#pragma once
#ifndef SONGCOLLECTION_H
#define SONGCOLLECTION_H
#include <string>
#include <vector>
#include <list> 
using namespace std;
namespace sdds {

	struct Song {
		string m_artist;
		string m_title;
		string m_album;
		double m_price;
		int m_releaseYear;
		int m_songLength;
		Song();
	};


	class SongCollection {
		vector<Song> m_song;
		int checkSpace(string data);
		string deleteSpace(string data);
	public:
		void sort(string data);
		void display(std::ostream& out) const;
		SongCollection() {};
		SongCollection(string file);
		void cleanAlbum();
		bool inCollection(string artist) const;
		std::list<Song> getSongsForArtist(string name) const;
	};
	 ostream& operator<< (ostream& out, const Song& theSong);

}






#endif // !SONGCOLLECTION_H
