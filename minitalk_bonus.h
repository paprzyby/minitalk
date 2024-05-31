/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minitalk_bonus.h                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: paprzyby <paprzyby@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/31 11:45:27 by paprzyby          #+#    #+#             */
/*   Updated: 2024/05/31 14:12:40 by paprzyby         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#if !defined(MINITALK_BONUS_H)
# define MINITALK_BONUS_H

# include <unistd.h>
# include <signal.h>

void	ft_putnbr(int n);
void	ft_bzero(void *ptr, size_t size);
int		ft_strlen(char *str);
int		ft_atoi(char *str);
void	kill_function(char *pid, char *str);
void	signal_handler(int signal, siginfo_t *info, void *x);
void	signal_received(int signal);

#endif
