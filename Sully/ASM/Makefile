CASM	= nasm
CFLAGS	= -f elf64 -Wx -Werror

RM		= rm -f

NAME	= Sully

SRC = Sully.s
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

re: fclean all

.PHONY: all clean fclean re