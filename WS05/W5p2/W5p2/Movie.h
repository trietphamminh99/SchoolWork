#pragma once
#ifndef MOVIE_H
#define	MOVIE_H
#include <string>
using namespace std;
namespace sdds {
	class Movie {
		size_t  m_years;
		string m_title;
		string m_description;
		string deleteSpace(string data);
	
	public:
		Movie();
		
		const std::string& title() const;
		Movie(const std::string& strMovie);
		template <typename T>
		void fixSpelling(T& spellChecker) {
			spellChecker(m_description);
			spellChecker(m_title);
		}

		virtual ostream& display(std::ostream& os)const;
		friend std::ostream& operator<<(std::ostream& os, const Movie& T);
	};
}



#endif