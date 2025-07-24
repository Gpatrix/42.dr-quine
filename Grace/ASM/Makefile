CASM	= nasm
CFLAGS	= -f elf64 -Wx -Werror

RM		= rm -f

NAME	= Grace

SRC = Grace.s
OBJ = $(SRC:.s=.o)

all: $(NAME)

%.o: %.s
	$(CASM) $(CFLAGS) -o $@ $<

$(NAME): $(OBJ)
	gcc -g -o $@ $^

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)
	$(RM) Grace_kid.s

re: fclean all

.PHONY: all clean fclean re