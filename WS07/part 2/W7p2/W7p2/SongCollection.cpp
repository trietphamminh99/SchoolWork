#include <fstream>
#include <string>
#include <iostream>
#include <istream>
#include <algorithm>
#include <iomanip>
#include <iterator>
#include "SongCollection.h"

using namespace std;
namespace sdds {
	int SongCollection::checkSpace(string data)
	{
		
		 int flag = 0, cnt = 0;
		string dummy{ data };
		//Check space 
		{
			for (size_t i = 0; flag != 1; i++)
			{

				if (dummy[i] == ' ' && dummy[i+1] == ' ')
				{

					flag = 1;
				}
				else {
					cnt++;
				}
				
			}
			flag = 0;
		}
		return cnt;
	}

	string SongCollection::deleteSpace(string data)
	{
		unsigned int flag = 0;
		string dummy{ data };
		//delete space 
		{
			for (size_t i = 0; flag != 1; i++)
			{

				if (dummy[i] == ' ')
				{
					dummy.erase(i, 1);
					i--;
					
				}
				else
				{
					flag = 1;
				}
			}
			flag = 0;
		}
		return dummy;
	}
	bool SongCollection::inCollection(string artist) const{
		bool boolen = false;
		for_each(m_song.begin(), m_song.end(), [&](const Song& song) {
			if (song.m_artist == artist)
			{
				boolen = true; 
			}
			});
		return boolen;
	}

	std::list<Song> SongCollection::getSongsForArtist(string name) const
	{
		list<Song> artistSong;
		for_each(m_song.begin(), m_song.end(), [&](const Song& song) {
			if (song.m_artist == name)
			{
				artistSong.push_back(song);
			}
			});
		return  artistSong;
	}
	

	SongCollection::SongCollection(string fileName)
	{
		int i = 0;
		auto k = 0;
		
		string dummy;
		Song song ;
		ifstream file(fileName);
		if (file) {
			while (file) {
				getline(file, dummy);
				if (dummy != " ")
				{
					k = checkSpace(dummy);
					song.m_title =deleteSpace(dummy.substr(0, k));
					dummy.erase(0, k);
					dummy.erase(0, dummy.find_first_not_of(' '));

					k = checkSpace(dummy);
					song.m_artist = dummy.substr(0, k);
					dummy.erase(0, k);
					dummy.erase(0, dummy.find_first_not_of(' '));


					k = checkSpace(dummy);
					song.m_album = dummy.substr(0, k);
					dummy.erase(0, k);

					if (dummy.substr(0, dummy.find_first_not_of(' ')).length() > 20)
					{
						song.m_releaseYear = 0;
						dummy.erase(0, dummy.find_first_not_of(' '));
					}
					else
					{
						dummy.erase(0, dummy.find_first_not_of(' '));
						song.m_releaseYear = stoi(dummy.substr(0, dummy.find_last_not_of(' ')));
						dummy.erase(0, dummy.find(' '));
						dummy.erase(0, dummy.find_first_not_of(' '));
					}

					song.m_songLength = stoi(dummy.substr(0, dummy.find_last_not_of(' ')));
					dummy.erase(0, dummy.find(' '));
					dummy.erase(0, dummy.find_first_not_of(' '));


					song.m_price = stod(dummy);

					m_song.push_back(song);
					dummy = ' ';
				}
			}
		}
		else
		{
			cout << "ERROR WHEN READING FILE" << endl;
			
		}
		file.close();
	}
	void SongCollection::cleanAlbum()
	{
		
		for_each(m_song.begin(), m_song.end(), [&](Song& song) {
			if (song.m_album == "[None]")
			{
				song.m_album = " ";
			}
			});
		
	}
	void SongCollection::sort(string data)
	{
		
		if (data == "title")
		{
			::sort(m_song.begin(), m_song.end(), [](const Song& song1, const Song& song2) {return (song1.m_title < song2.m_title); });
		}
		if (data == "length")
		{
			::sort(m_song.begin(), m_song.end(), [](const Song& song1, const Song& song2) {return (song1.m_songLength < song2.m_songLength); });
		}	
		if (data == "album")
		{
			::sort(m_song.begin(), m_song.end(), [](const Song& song1, const Song& song2) {return (song1.m_album < song2.m_album); });
		}

	}
	void SongCollection::display(std::ostream& out) const
	{
		
		int totalTime = 0;
		for_each(m_song.begin(), m_song.end(), [&out](const Song& song) {
			out << song << endl;
		});
		for_each(m_song.begin(), m_song.end(), [&totalTime](const Song& song) {
			totalTime += song.m_songLength ;
		});
		out << "----------------------------------------------------------------------------------------" << endl;
		//time calculation
		int h = 0, s = 0, m = 0;
		h = totalTime / 3600;
		m = (totalTime - (h * 3600)) / 60;
		s = totalTime - (h * 3600) - m * 60;


		out << "|" << right << setw(78) << "Total Listening Time:" << h << ":" << m << ":" << s << " |" << endl;

	}

	Song::Song()
	{
		m_artist = "";
		m_title = "";
		m_album = "";
		m_releaseYear = 0;
		m_songLength = 0;
		m_price = 0.0;
	}

	ostream& operator<<(ostream& out, const Song& theSong)
	{
		
		out << " | " << setw(20) << left << theSong.m_title << " | " << setw(15) << left << theSong.m_artist << " | " << setw(20) << theSong.m_album << " | ";
		if (theSong.m_releaseYear == 0)
		{
			out << setw(6) << ' ';
		}
		else
		{
			out << setw(6) << theSong.m_releaseYear;
		}
		out << " | " << theSong.m_songLength / 60 << ':';

		out << right << setw(2) << setfill('0') << theSong.m_songLength % 60 << setfill(' ') << " | ";
		out << theSong.m_price << "|" ;
		return out;
	}

}