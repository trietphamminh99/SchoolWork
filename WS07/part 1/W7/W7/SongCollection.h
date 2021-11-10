#pragma once
#ifndef SONGCOLLECTION_H
#define SONGCOLLECTION_H
#include <string>
#include <vector>
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
		void display(std::ostream& out) const;
		SongCollection() {};
		SongCollection(string file);

	};
	 ostream& operator<< (ostream& out, const Song& theSong);

}






#endif // !SONGCOLLECTION_H
