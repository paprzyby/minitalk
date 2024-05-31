/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: paprzyby <paprzyby@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/31 13:18:59 by paprzyby          #+#    #+#             */
/*   Updated: 2024/05/31 13:19:16 by paprzyby         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <signal.h>

void	ft_putnbr(int n)
{
	char	c;

	if (n >= 10)
		ft_putnbr(n / 10);
	c = (n % 10) + '0';
	write(1, &c, 1);
}

void	ft_bzero(void *ptr, size_t size)
{
	size_t			i;
	unsigned char	*p;

	p = (unsigned char *)ptr;
	i = 0;
	while (i < size)
	{
		p[i] = 0;
		i++;
	}
}

void	signal_handler(int signal)
{
	static int	bit;
	static int	c;

	if (signal == SIGUSR1)
	{
		c = c | (0 << bit);
		bit++;
	}
	else if (signal == SIGUSR2)
	{
		c = c | (1 << bit);
		bit++;
	}
	if (bit == 8)
	{
		write (1, &c, 1);
		bit = 0;
		c = 0;
	}
}

int	main(void)
{
	struct sigaction	sa;

	ft_putnbr(getpid());
	write(1, "\n", 1);
	ft_bzero(&sa, sizeof(sa));
	sa.sa_handler = &signal_handler;
	sigaction(SIGUSR1, &sa, NULL);
	sigaction(SIGUSR2, &sa, NULL);
	while (1)
		pause();
	return (0);
}
