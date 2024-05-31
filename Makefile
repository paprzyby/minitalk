# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: paprzyby <paprzyby@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/14 19:11:05 by paprzyby          #+#    #+#              #
#    Updated: 2024/05/31 13:59:33 by paprzyby         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=

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

all:				$(CLIENT) $(SERVER) $(CLIENT_BONUS) $(SERVER_BONUS)

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
					$(RM) $(CLIENT) $(SERVER) $(CLIENT_BONUS) $(SERVER_BONUS) $(OBJECTS) $(OBJECTS_BONUS)

bonus:				$(CLIENT_BONUS) $(SERVER_BONUS)

re:					fclean all

.PHONY:				all clean fclean re bonus

#NAME is not explicitly specified as a target.
#It seems to be intended as a variable to potentially hold a name,
#but it's not used in any of the rules or targets