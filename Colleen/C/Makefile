CC		= gcc
CFLAGS	= -Wall -Wextra -Werror -g3

RM		= rm -f

NAME	= Colleen

SRC = Colleen.c

all: $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(NAME): ${SRC}
	$(CC) $(CFLAGS) -o $@ $^

fclean:
	$(RM) $(NAME)

re: fclean all

.PHONY: all fclean re