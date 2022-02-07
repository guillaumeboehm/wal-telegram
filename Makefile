PREFIX := /usr/share

#install by default
all: install

install:
	install -Dm644 ./LICENSE "$(PREFIX)/licenses/wal-telegram/LICENSE"
	install -Dm755 ./wal-telegram "$(PREFIX)/wal-telegram/wal-telegram"
	install -Dm644 ./colors.wt-constants "$(PREFIX)/wal-telegram/colors.wt-constants"
	rm -f $(PREFIX)/wal-telegram/.shortcut
	echo "/bin/sh -c \"$(PREFIX)/wal-telegram/wal-telegram \$$@\"" >> $(PREFIX)/wal-telegram/.shortcut
	chmod 755 $(PREFIX)/wal-telegram/.shortcut
	install -Dm755 $(PREFIX)/wal-telegram/.shortcut "/usr/bin/wal-telegram"

uninstall:
	rm -rf "$(PREFIX)/licenses/wal-telegram"
	rm -rf "$(PREFIX)/wal-telegram"
	rm -f "/usr/bin/wal-telegram"

.PHONY: all install uninstall
