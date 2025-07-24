CC		= gcc
CFLAGS	= -Wall -Wextra -Werror -g3

RM		= rm -f

NAME	= Grace

SRC = Grace.c

all: $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(NAME): ${SRC}
	$(CC) $(CFLAGS) -o $@ $^

fclean:
	$(RM) $(NAME)
	$(RM) Grace_kid.c

re: fclean all

.PHONY: all fclean re