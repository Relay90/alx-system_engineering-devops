#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/**
 * infinite_while - creates an infinite loop that sleeps
 * for 1 second in each iteration
 * Return: 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}
/**
 * main - Creates zombie processes using fork
 *
 * Return: 0
 */
int main(void)
{
	pid_t child_pid;
	int i;

	for (i = 0; i < 5; i++)
	{
		child_pid = fork();

		if (child_pid == 0)
		{
			/* Child process */
			printf("Zombie process created, PID: %d\n", getpid());
			exit(0);
		}
		else if (child_pid < 0)
		{
			/* Error creating child process */
			perror("fork");
			exit(1);
		}
	}

	infinite_while(); /* Infinite loop to keep the parent process alive */

	return (0);
}
