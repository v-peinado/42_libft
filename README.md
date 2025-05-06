# libft

## Description
The libft project is a custom C library that implements various standard functions as well as additional utilities. This library serves as a foundation for future C programming projects, allowing us to use our own implementations instead of the standard library functions.

## Core Concepts

### Static Libraries in C

A static library (`.a` file) is a collection of object files (`.o`) that are linked into the program during the linking phase of compilation. Unlike dynamic libraries, static libraries become part of the executable, which means:

- No external dependencies at runtime
- Potentially larger executable size
- Guaranteed version consistency

#### Creating a Static Library

The process of creating a static library involves:

1. Compiling source files to object files
2. Archiving those object files into a single `.a` file
3. Creating an index for the library

```bash
# Compilation
gcc -Wall -Wextra -Werror -c *.c

# Creating the archive
ar rcs libft.a *.o
```

The `ar` flags used:
- `r`: Replace or add files to the archive
- `c`: Create the archive if it doesn't exist
- `s`: Create an index (symbol table)

### Makefile Structure

Our Makefile follows standard conventions for C projects and includes specific rules for handling the main library and bonus functions. Here's an explanation of our Makefile:

```make
# Source files for the main library
SRCS = ft_bzero.c ft_isdigit.c ft_memcpy.c ft_strncmp.c ft_toupper.c \
       ft_isalnum.c ft_isprint.c ft_memset.c ft_strnstr.c \
       ft_isalpha.c ft_memchr.c ft_strchr.c ft_strrchr.c \
       ft_isascii.c ft_memcmp.c ft_strlen.c ft_tolower.c \
       ft_strlcpy.c ft_strnstr.c ft_memmove.c ft_atoi.c \
       ft_calloc.c ft_strdup.c ft_strlcat.c ft_strjoin.c \
       ft_putstr_fd.c ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
       ft_substr.c ft_striteri.c ft_strmapi.c ft_strtrim.c ft_split.c \
       ft_itoa.c

# Object files generated from source files
OBJS = $(SRCS:.c=.o)

# Bonus source files (linked list operations)
BONUS = ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
        ft_lstiter.c ft_lstmap.c ft_lstclear.c ft_lstdelone.c \
        ft_lstadd_back.c

# Bonus object files
BONUS_OBJS = $(BONUS:.c=.o)

# Compiler and flags
CC = gcc
RM = rm -fr
CFLAGS = -Wall -Wextra -Werror

# Library name
NAME = libft.a

# Default rule
all: $(NAME)

# Rule to create the library
$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

# Rule to clean object files
clean:
	$(RM) $(OBJS) $(BONUS_OBJS)

# Rule to clean everything including the library
fclean: clean
	$(RM) $(NAME)

# Rule to rebuild everything
re: fclean $(NAME)

# Rule to build the library with bonus functions
bonus: $(OBJS) $(BONUS_OBJS)
	ar rcs $(NAME) $(OBJS) $(BONUS_OBJS)

# Declare phony targets
.PHONY: all clean fclean re
```

#### Key Components

1. **Variables**:
   - `SRCS`: List of source files for standard functions
   - `OBJS`: Object files generated from source files
   - `BONUS`: List of source files for bonus (linked list) functions
   - `BONUS_OBJS`: Object files for bonus functions
   - `CC`, `RM`, `CFLAGS`: Build configuration
   - `NAME`: Output library name

2. **Rules**:
   - `all`: Default target that builds the library
   - `$(NAME)`: Rule to create the library from object files
   - `clean`: Removes all object files
   - `fclean`: Removes object files and the library
   - `re`: Rebuilds everything from scratch
   - `bonus`: Builds the library with linked list functions included

3. **Pattern Substitution**:
   - `$(SRCS:.c=.o)`: Automatically converts `.c` filenames to `.o`

### Linked Lists

Linked lists are dynamic data structures consisting of nodes that contain data and pointers to other nodes. They offer several advantages:

- Dynamic size (unlike arrays)
- Efficient insertions and deletions
- No need for contiguous memory allocation

#### Our Implementation

Our implementation includes a standard singly linked list structure:

```c
typedef struct s_list
{
    void            *content;    // Data stored in the node
    struct s_list   *next;       // Pointer to the next node
} t_list;
```

#### Linked List Functions

Our library implements the following linked list operations:

1. **ft_lstnew**: Creates a new list node
```c
t_list *ft_lstnew(void *content);
```

2. **ft_lstadd_front**: Adds a node at the beginning of the list
```c
void ft_lstadd_front(t_list **lst, t_list *new);
```

3. **ft_lstadd_back**: Adds a node at the end of the list
```c
void ft_lstadd_back(t_list **lst, t_list *new);
```

4. **ft_lstsize**: Counts the number of nodes in a list
```c
int ft_lstsize(t_list *lst);
```

5. **ft_lstlast**: Returns the last node of the list
```c
t_list *ft_lstlast(t_list *lst);
```

6. **ft_lstdelone**: Deletes a single node
```c
void ft_lstdelone(t_list *lst, void (*del)(void *));
```

7. **ft_lstclear**: Deletes and frees the entire list
```c
void ft_lstclear(t_list **lst, void (*del)(void *));
```

8. **ft_lstiter**: Applies a function to each node's content
```c
void ft_lstiter(t_list *lst, void (*f)(void *));
```

9. **ft_lstmap**: Creates a new list by applying a function to each node
```c
t_list *ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *));
```

## Library Functions

Our libft library includes the following categories of functions:

### Character Functions
- `ft_isalpha`: Checks if character is alphabetic
- `ft_isdigit`: Checks if character is a digit
- `ft_isalnum`: Checks if character is alphanumeric
- `ft_isascii`: Checks if character is in ASCII table
- `ft_isprint`: Checks if character is printable
- `ft_toupper`: Converts character to uppercase
- `ft_tolower`: Converts character to lowercase

### String Functions
- `ft_strlen`: Gets string length
- `ft_strchr`: Locates first occurrence of character in string
- `ft_strrchr`: Locates last occurrence of character in string
- `ft_strncmp`: Compares two strings up to n characters
- `ft_strlcpy`: Copies string with size limitation
- `ft_strlcat`: Concatenates strings with size limitation
- `ft_strnstr`: Locates substring in a string, limited by length
- `ft_strdup`: Duplicates a string
- `ft_substr`: Creates substring from string
- `ft_strjoin`: Concatenates two strings
- `ft_strtrim`: Trims characters from string
- `ft_split`: Splits string by delimiter
- `ft_strmapi`: Applies function to each character with index
- `ft_striteri`: Applies function to each character with index

### Memory Functions
- `ft_memset`: Fills memory with a constant byte
- `ft_bzero`: Zeros out memory
- `ft_memcpy`: Copies memory area
- `ft_memmove`: Copies memory area with overlap handling
- `ft_memchr`: Locates byte in memory area
- `ft_memcmp`: Compares memory areas
- `ft_calloc`: Allocates and zeros memory

### Conversion Functions
- `ft_atoi`: Converts string to integer
- `ft_itoa`: Converts integer to string

### File Descriptor Functions
- `ft_putchar_fd`: Outputs character to file descriptor
- `ft_putstr_fd`: Outputs string to file descriptor
- `ft_putendl_fd`: Outputs string with newline to file descriptor
- `ft_putnbr_fd`: Outputs number to file descriptor

## Usage

1. Clone the repository
2. Compile the library:
   - For standard functions: `make`
   - For standard + linked list functions: `make bonus`
3. Include the header in your C files: `#include "libft.h"`
4. Compile your program with the library:
   ```bash
   gcc -o your_program your_file.c -L. -lft
   ```

Where:
- `-L.` tells the compiler to look for libraries in the current directory
- `-lft` links against libft.a (the 'lib' prefix and '.a' suffix are implicit)

## Conclusion

The libft project provides a solid foundation for C programming by implementing essential functions and data structures. Understanding static libraries, Makefiles, and linked lists is crucial for efficient C development and will be valuable in future programming projects.
