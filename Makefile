# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: paprzyby <paprzyby@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/14 19:11:05 by paprzyby          #+#    #+#              #
#    Updated: 2024/05/31 11:03:31 by paprzyby         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=

SOURCE		=	client.c server.c

OBJECTS		=	$(SOURCE:.c=.o)

CC			=	cc

RM			=	rm -f

FLAGS		=	-Wall -Wextra -Werror

CLIENT		=	client

SERVER		=	server

all:			$(CLIENT) $(SERVER)

$(NAME):		all

$(SERVER):		server.o
				$(CC) $(FLAGS) -o $(SERVER) server.o

$(CLIENT):		client.o
				$(CC) $(FLAGS) -o $(CLIENT) client.o

%.o:			%.c
				$(CC) $(FLAGS) -c $< -o $@

clean:
				$(RM) $(OBJECTS)

fclean:			clean
				$(RM) $(SERVER) $(CLIENT)

re:				fclean all

.PHONY:			all clean fclean re

#NAME is not explicitly specified as a target.
#It seems to be intended as a variable to potentially hold a name,
#but it's not used in any of the rules or targets