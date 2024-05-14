# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: paprzyby <paprzyby@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/14 19:11:05 by paprzyby          #+#    #+#              #
#    Updated: 2024/05/14 19:19:18 by paprzyby         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SOURCE		=

OBJECTS		=	$(SOURCE:.c=.o)

CC			=	cc

RM			=	rm -f

CFLAGS		=	-Wall -Wextra -Werror

%.o:			%.c
				$(CC) $(CFLAGS) -c $< -o $@

clean:
				$(RM) $(OBJECTS)

fclean:			clean
				$(RM)

re:				fclean all

.PHONY:			all clean fclean re
