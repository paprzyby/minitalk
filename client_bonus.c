/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: paprzyby <paprzyby@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/31 13:16:13 by paprzyby          #+#    #+#             */
/*   Updated: 2024/06/06 14:17:04 by paprzyby         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk_bonus.h"

int	ft_atoi(char *str)
{
	int	number;

	number = 0;
	while (*str >= '0' && *str <= '9')
	{
		number = number * 10 + (*str - '0');
		str++;
	}
	return (number);
}

int	ft_strlen(char *str)
{
	unsigned int	i;

	i = 0;
	while (str[i])
		i++;
	return (i);
}

void	kill_function(char *pid, char *str)
{
	int				bit;
	unsigned int	len;
	unsigned int	i;
	int				result;

	len = ft_strlen(str) + 1;
	i = 0;
	result = 0;
	while (i < len)
	{
		bit = 0;
		while (bit < 8)
		{
			result = (str[i] & (1 << bit));
			if (result == 0)
				kill(ft_atoi(pid), SIGUSR1);
			else
				kill(ft_atoi(pid), SIGUSR2);
			usleep(500);
			bit++;
		}
		i++;
	}
}

void	signal_received(int signal)
{
	if (signal == SIGUSR1)
		write(1, "The signal has been successfully received\n", 42);
}

int	main(int argc, char **argv)
{
	struct sigaction	sa;

	sa.sa_handler = &signal_received;
	sigaction(SIGUSR1, &sa, NULL);
	if (argc > 3)
	{
		write(1, "Error:\n", 7);
		write(1, "Too many arguments passed\n", 26);
		return (0);
	}
	else if (argc < 3)
	{
		write(1, "Error:\n", 7);
		write(1, "Too few arguments passed\n", 25);
		return (0);
	}
	else
		kill_function(argv[1], argv[2]);
	return (1);
}
