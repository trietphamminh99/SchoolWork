#pragma once

#ifndef BOOK_H
#define BOOK_H
#include <string>
using namespace std;
namespace sdds {

	class Book {
		string A_name;
		string m_title;
		string m_country;
		size_t p_years;
		double m_price;
		string m_description;
		string deleteSpace(string data);
	public:
		Book();
		const std::string& title() const;
		const size_t& year() const;
		Book(const std::string& strBook);
		virtual ostream& display(std::ostream& os)const;
		double& price();
		friend std::ostream& operator<<(std::ostream& os, const Book& T);
		const std::string& country() const;


		template <typename T>
		void fixSpelling(T& spellChecker) {
			spellChecker (m_description);
		
		}

		virtual ~Book() {};



	};



};




#endif // !BOOK_H;
