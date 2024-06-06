# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: paprzyby <paprzyby@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/14 19:11:05 by paprzyby          #+#    #+#              #
#    Updated: 2024/06/06 14:14:55 by paprzyby         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	minitalk

SOURCE			=	client.c server.c

SOURCE_BONUS	=	client_bonus.c server_bonus.c

OBJECTS			=	$(SOURCE:.c=.o)

OBJECTS_BONUS	=	$(SOURCE_BONUS:.c=.o)

CC				=	cc

RM				=	rm -f

FLAGS			=	-Wall -Wextra -Werror

CLIENT			=	client

SERVER			=	server

CLIENT_BONUS	=	client_bonus

SERVER_BONUS	=	server_bonus

all:				$(CLIENT) $(SERVER)

$(NAME):			all

$(CLIENT):			client.o
					$(CC) $(FLAGS) -o $(CLIENT) client.o

$(SERVER):			server.o
					$(CC) $(FLAGS) -o $(SERVER) server.o

$(CLIENT_BONUS):	client_bonus.o
					$(CC) $(FLAGS) -o $(CLIENT_BONUS) client_bonus.o

$(SERVER_BONUS):	server_bonus.o
					$(CC) $(FLAGS) -o $(SERVER_BONUS) server_bonus.o

%.o:				%.c minitalk.h minitalk_bonus.h
					$(CC) $(FLAGS) -c $< -o $@

clean:
					$(RM) $(OBJECTS) $(OBJECTS_BONUS)

fclean:				clean
					$(RM) $(CLIENT) $(SERVER) $(CLIENT_BONUS) $(SERVER_BONUS)

bonus:				$(CLIENT_BONUS) $(SERVER_BONUS)

re:					fclean all

.PHONY:				all clean fclean re bonus
