#define _CRT_SECURE_NO_WARNINGS
#include "Reservation.h"
#include <iostream>
#include <string>
#include <iomanip>
using namespace std;
namespace sdds {

	int Reservation::countString(int start, string mainString)
	{
		int count = 0;
		for (size_t i = start; i < mainString.size(); i++)
		{
			if (mainString[i] != ',')
			{
				count++;
				
			}
		}
		return count;
	}

	Reservation::Reservation()
	{}
	Reservation::Reservation(const std::string& res)
	{
		if (res != " ")
		{

			string dummy{ res };


			string interger;

			for (size_t i = 0; i < dummy.size(); i++)
			{
				if (dummy[i] == ' ')
				{
					dummy.erase(i, 1);
					i--;
				}
			}


			m_id = new char[dummy.substr(0, dummy.find(':')).length()];
			strcpy(m_id, dummy.substr(0, dummy.find(':')).c_str());
			dummy.erase(0, strlen(m_id) + 1);


			m_name = dummy.substr(0, dummy.find(','));
			dummy.erase(0, m_name.length() + 1);


			m_email = dummy.substr(0, dummy.find(','));
			dummy.erase(0, m_email.length() + 1);

			interger = dummy.substr(0, dummy.find(','));
			m_people = stoi(interger);
			dummy.erase(0, 2);

			interger = dummy.substr(0, dummy.find(','));
			m_day = stoi(interger);
			dummy.erase(0, 2);

			interger = dummy.substr(0, dummy.find(','));
			m_hours = stoi(interger);
		}

	}

	std::ostream& Reservation::display(std::ostream& os) const
	{
		string meal = "Drinks";
		int time = m_hours;
		os << "Reservation ";
		
		
		os <<right << setw(10) << m_id << ": ";
		
		
		os<< right << setw(20)  << m_name+ "  ";
		
	
		
		os <<left<<setw(24) << "<" + m_email + "> ";
		if (m_hours >= 6 && m_hours <= 9)
		{
			meal = "Breakfast";
		}
		if (m_hours >= 11 && m_hours <= 15)
		{
			meal = "Lunch";
		}
		if (m_hours >= 17 && m_hours <= 21)
		{
			meal = "Dinner";
		}
		
		os << meal << " on day " << m_day << " @ " <<m_hours<<":00 for ";
		if (m_people == 1){
			os << m_people << " person \n";
		}
		else
		{
			os << m_people << " people \n";
		}
		return os;
	}

	std::ostream& operator<<(std::ostream& os, const Reservation& T)
	{
		T.display(os);
		return os;
	}

}
