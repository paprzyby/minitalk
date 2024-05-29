/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: paprzyby <paprzyby@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/16 12:51:01 by paprzyby          #+#    #+#             */
/*   Updated: 2024/05/29 16:23:49 by paprzyby         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <signal.h>

int	ft_atoi(const char *str)
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

void	kill_function(char *pid)
{
	int	id;

	id = ft_atoi(pid);
	kill(id, SIGUSR1);
}

int	main(int argc, char **argv)
{
	if (argc > 3)
	{
		write(1, "Error: ", 7);
		write(1, "Too many parameters passed\n", 27);
		return (0);
	}
	//else if (argc < 3)
	//{
	//	write(1, "Error: ", 7);
	//	write(1, "Too few parameters passed\n", 26);
	//	return (0);
	//}
	else
		kill_function(argv[1]);
	return (1);
}
