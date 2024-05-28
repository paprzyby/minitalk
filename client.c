/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: paprzyby <paprzyby@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/16 12:51:01 by paprzyby          #+#    #+#             */
/*   Updated: 2024/05/28 12:35:06 by paprzyby         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <signal.h>

void	kill_function(char *pid, char *str)
{

}

int	main(int argc, char **argv)
{
	if (argc > 3)
	{
		write(1, "Error: ", 7);
		write(1, "Too many parameters passed\n", 27);
		return (0);
	}
	else if (argc < 3)
	{
		write(1, "Error: ", 7);
		write(1, "Too few parameters passed\n", 26);
		return (0);
	}
	else
		kill_function(argv[1], argv[2]);
	return (1);
}
