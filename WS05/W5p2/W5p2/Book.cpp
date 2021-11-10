#include<iostream>
#include <iomanip>
#include"Book.h"
using namespace std;
namespace sdds {
	unsigned int space = 0; 

	Book::Book(){
		A_name = ' ';
		m_country = ' ';
		m_description = ' ';
		m_price = 0;
		p_years = 0;
		m_title = ' ';
	}

	const std::string& Book::title() const
	{
		return m_title;
	}

	const size_t& Book::year() const
	{
		return p_years;
	}

	string Book::deleteSpace(string data) {
		unsigned int flag = 0;
		string dummy{data};
		//delete space 
		{
			for (size_t i = 0; flag != 1; i++)
			{

				if (dummy[i] == ' ')
				{
					dummy.erase(i, 1);
					i--;
					space++;
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

	Book::Book(const std::string& res)
	{
			string dummy{ res };
			string tempVal;
			unsigned flag = 0;

				tempVal = dummy.substr(0, dummy.find(','));
				A_name = deleteSpace(tempVal);
				dummy.erase(0, A_name.length() + 1);
				space = 0;

				tempVal = dummy.substr(0, dummy.find(','));
				tempVal = deleteSpace(tempVal);
				//delate space backward
				{
					for (size_t i = tempVal.length()-1; flag != 1; i--)
					{

						if (tempVal[i] == ' ')
						{
							tempVal.erase(i, 1);
							space++;
						}
						else
						{
							flag = 1;
						}
					}
					flag = 0;
				}
				m_title = tempVal;
				dummy.erase(0, m_title.length() + space +1);
				space = 0;


				tempVal = dummy.substr(0, dummy.find(','));
				m_country = deleteSpace(tempVal);
				dummy.erase(0, m_country.length() +space+ 1);
				space = 0;


				tempVal = deleteSpace(dummy.substr(0, dummy.find(',')));
				m_price = stod(tempVal);
				dummy.erase(0, tempVal.length()+ space + 1);
				space = 0;

				tempVal = deleteSpace(dummy.substr(0, dummy.find(',')));
				p_years = stoi(tempVal);
				dummy.erase(0, tempVal.length() +space+ 1);
				space = 0;

				tempVal = deleteSpace(dummy.substr(0, dummy.find('.')));
				//delete space 
				
				 m_description = tempVal;
				 space = 0;
			
		}

	ostream& Book::display(std::ostream& os) const
	{
		os << setw(20) << A_name << " | ";
		os << setw(22) << title() << " | ";
		os << setw(5) << m_country << " | ";
		os << setw(4) << year() << " | ";
		os << fixed << setprecision(2);
		os << setw(6) << m_price << " | ";
		os << m_description << ".\n";
		return os;
	}

	const std::string& Book::country() const
	{
		return m_country;
	}



	

	double& Book::price()
	{
		return m_price;
	}

	
	std::ostream& operator<<(std::ostream& os, const Book& T)
	{
		T.display(os);
		return os;
	}
}

