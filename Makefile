CC=gcc
FLAGS=-Wall -O0

all: faxpy.out faxpySIMD4.out faxpySIMD2.out

faxpy.out: test_faxpy.o faxpy.o
	$(CC) $(FLAGS) $^ -o $@

faxpySIMD4.out: test_faxpy.o faxpySIMD4.o
	$(CC) $(FLAGS) $^ -o $@

faxpySIMD2.out: test_faxpy.o faxpySIMD2.o
	$(CC) $(FLAGS) $^ -o $@

test_faxpy.o: test_faxpy.c
	$(CC) $(FLAGS) -c $< -o $@

faxpy.o: faxpy.s
	$(CC) $(FLAGS) -c $< -o $@

faxpySIMD4.o: faxpySIMD4.s
	$(CC) $(FLAGS) -c $< -o $@

faxpySIMD2.o: faxpySIMD2.s
	$(CC) $(FLAGS) -c $< -o $@

clean:
	rm -rf *.o *.out

