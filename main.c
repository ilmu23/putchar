/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ivalimak <ivalimak@student.hive.fi>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/11 19:19:57 by ivalimak          #+#    #+#             */
/*   Updated: 2023/11/11 19:23:37 by ivalimak         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "putchar.h"

void	putchar(char c);

int	main(int argc, char **argv)
{
	char	*chars;

	if (argc < 2)
		return (1);
	chars = argv[1];
	while (*chars)
		putchar(*chars++);
	putchar('\n');
	return (0);
}
