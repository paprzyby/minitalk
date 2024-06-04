/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: paprzyby <paprzyby@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/16 12:51:01 by paprzyby          #+#    #+#             */
/*   Updated: 2024/06/04 16:03:18 by paprzyby         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

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

	len = ft_strlen(str);
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

int	main(int argc, char **argv)
{
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
