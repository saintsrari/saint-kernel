#include <stdint.h>

void clear_screen() {
  volatile char *video = (volatile char*) 0xB8000;
	for (int i = 0; i < 80 * 25; i++) {
		video[i * 2] = ' ';
		video[i * 2 + 1] = 0x0F;
	}
}

void print(const char* mensagem) {
	volatile char *video = (volatile char*) 0xB8000;
	int x = 0, y = 0;

	for (int i = 0; mensagem[i] != '\0'; i++) {
		if (mensagem[i] == '\n') {
			x = 0;
			y++;
		} else {
			int pos = (y * 80 + x) * 2;
			video[pos] = mensagem[i];
			video[pos + 1] = 0x0F;
			x++;
			if (x >= 80) {
				x = 0;
				y++;
			}
		}
		if (y >= 25) break;
	}
}

void kernel_main() {
	clear_screen();
	print("Hello from Saint Kernel!\n\nUm simples kernel sem funcionalidades :D");
	while (1);
}
