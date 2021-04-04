#!/bin/python3
# pip install python-musicpd
import random
import musicpd

class MpdClient():
    def __init__(self):
        self.cli = musicpd.MPDClient()
        self.cli.connect()

    def getalbums(self):
        playlist = self.cli.playlistinfo()
        albums = {}
        for song in playlist:
            try:
                if song['album'] == '':
                    album = str(song['artist'])
                else:
                    album = str(song['album'])
            except KeyError:
                album = 'None'
            try:
                if album not in albums:
                    albums[album] = [song]
                else:
                    albums[album].append(song)
            except TypeError:
                print(album)
        return albums

    def currentsong(self):
        return self.cli.currentsong()['title'] + self.cli.currentsong()['artist']
    def currentalbum(self):
        return self.cli.currentsong()['album']

    def random_album(self, albums):
        albums = list(albums.keys())
        current_album = self.currentalbum()
        if current_album:
            albums.pop(albums.index(current_album))
        if albums:
            return random.choice(albums)
        else:
            return None

    def shuffle_albums(self):
        albums = self.getalbums()

        album_names = list(albums.keys())
        random.shuffle(album_names)

        for album in album_names:
            self.move_album(albums[album])

    def __del__(self):
        self.cli.close()

    def move_album(self, album, pos=0):
        for song in album:
            self.cli.moveid(song['id'], pos)
            pos+=1

def main():
    client = MpdClient()
    client.shuffle_albums()

if __name__ == '__main__':
    main()

