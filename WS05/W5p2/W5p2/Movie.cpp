#include<iostream>
#include <iomanip>
#include "Movie.h"

namespace sdds {

	unsigned int spaceM = 0;
	const std::string& Movie::title() const
	{
		return m_title;
	}
	string sdds::Movie::deleteSpace(string data)
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
					spaceM++;
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

	sdds::Movie::Movie()
	{
		m_years = 0;
		m_title = "";
		m_description = "";
	}

	sdds::Movie::Movie(const std::string& strMovie)
	{
		string dummy{ strMovie };
		string tempVal;
		size_t flag = 0;
		
		tempVal = dummy.substr(0, dummy.find(','));
		tempVal = deleteSpace(tempVal);
		//delate space backward
		{

			for (size_t i = tempVal.length() - 1; flag != 1; i--)
			{

				if (tempVal[i] == ' ')
				{
					tempVal.erase(i, 1);
					spaceM++;
				
				}
				else
				{
					flag = 1;
				}
			}
			flag = 0;
		}
		m_title = tempVal;
		dummy.erase(0, tempVal.length() + spaceM  + 1);
		spaceM = 0;


		tempVal = deleteSpace(dummy.substr(0, dummy.find(',')));
		m_years = stoi(tempVal);
		dummy.erase(0, tempVal.length() + spaceM + 1);
		spaceM = 0;

		tempVal = deleteSpace(dummy.substr(0, dummy.find('.')));
		//delete space 
		m_description = tempVal;
		spaceM = 0;
	}

	ostream& sdds::Movie::display(std::ostream& os) const
	{

		os << setw(40) << title() << " | ";

		os << setw(4) << m_years << " | ";

		os << m_description << ".\n";
		return os;
	}

	std::ostream& operator<<(std::ostream& os, const Movie& T)
	{
		
		T.display(os);
		return os;
	}
}