//PHAM MINH TRIET
//ID:157930199



#include "ConfirmationSender.h"
#include "Reservation.h"
#include<iostream>

using namespace std;
namespace sdds {



	

	ConfirmationSender& ConfirmationSender::operator+=(const Reservation& res)
	{
		bool found = false;
		size_t i = 0;
		for (; i < m_noOfcon; i++)
		{
			if (&res == m_con[i])
			{
				found = true;
			}
		}
		if (found == false)
		{
			////Dynamically allocate a temp array in orther to resize;

			//const Reservation** temp = new const Reservation * [m_noOfcon + 1];
			//for (size_t i = 0; i < m_noOfcon; i++)
			//{
			//	temp[i] = m_con[i];
			//}
			//delete[] m_con;	//delete the old array 
			//m_con = temp; //set the array to the new array set by temp
			//m_con[m_noOfcon++] = &res; // add the new value
			//temp = nullptr; //do this to not leek memory?
			
			const Reservation** temp = new const Reservation * [m_noOfcon + 1];
			for (size_t i = 0; i < m_noOfcon; i++)
			{
				temp[i] = m_con[i];
			}
			delete[] m_con;
			temp[m_noOfcon] = &res;
			m_noOfcon++;
			m_con = std::move(temp);
			temp = nullptr;
		}
		return *this;
	}

	ConfirmationSender& ConfirmationSender::operator-=(const Reservation& res)
	{
		for (size_t i = 0; i < m_noOfcon; i++)
		{
			if (m_con[i] == &res)
			{
				m_con[i] = nullptr;
				m_noOfcon--;
			}
		}
		
		
		//int foundAt = 0;
		//size_t i = 0;
		//for (; i < m_noOfcon; i++)
		//{
		//	if (&res == m_con[i])
		//	{
		//		foundAt = i;
		//		
		//	}
		//}
		//if (foundAt > 0)
		//{
		//	for (i = foundAt; i < m_noOfcon; i++)
		//	{
		//		m_con[i] = nullptr; // set the value in that position to null
		//		m_con[i] = m_con[i+1];// set the value in that position to the next value 

		//	}
		//	if (m_noOfcon > 0)
		//	{
		//		m_con[m_noOfcon - 1] = nullptr; //the last value of the array will be null
		//		m_noOfcon--; //resize the array 
		//	}

		//}
		return *this;
	}

	ConfirmationSender::ConfirmationSender(const ConfirmationSender& val)
	{
		
		*this = val;
	}

	ConfirmationSender& ConfirmationSender::operator=(const ConfirmationSender& val)
	{
		if (this != &val)
		{
			m_noOfcon = val.m_noOfcon;
			if (val.m_con && m_noOfcon > 0)
			{
				const Reservation** temp = new const Reservation * [m_noOfcon + 1];
				for (size_t i = 0; i < m_noOfcon; i++)
				{
					temp[i] = val.m_con[i];
				}
				delete[] m_con;	//delete the old array 
				m_con = temp; //set the array to the new array set by temp
			}
		/*	m_noOfcon = val.m_noOfcon;
			if (val.m_con != nullptr)
			{
				m_con = new const Reservation * [];
				for (size_t i = 0; i < m_con; i++)
				{
					m_con[i] = val.m_con[i];
				}
			}
			else
			{
				m_con = nullptr;
			}*/

		}
		return *this;
	}
	//ConfirmationSender& ConfirmationSender::operator=(ConfirmationSender&& val)
	//{
	//	if (this != &val)
	//	{
	//		delete[] m_con;
	//		m_noOfcon = val.m_noOfcon;
	//		const Reservation** temp = new const Reservation * [m_noOfcon + 1];
	//		for (size_t i = 0; i < m_noOfcon; i++)
	//		{
	//			temp[i] = val.m_con[i];
	//		}
	//		delete[] m_con;	//delete the old array 
	//		m_con = temp; //set the array to the new array
	//		val.m_con = nullptr;
	//		val.m_noOfcon = 0;
	//	}
	//	return *this;
	//}
	ConfirmationSender::~ConfirmationSender()
	{
		delete[] m_con;
		m_con = nullptr;
	}
	ConfirmationSender::ConfirmationSender(ConfirmationSender&& val) noexcept
	{

		/*operator=(move(val));*/
		if (val.m_con != nullptr)
		{
			swap(m_con, val.m_con);
			m_noOfcon = val.m_noOfcon;
			val.m_noOfcon = 0;
			val.m_con = nullptr;
		}


	}

	std::ostream& operator<<(std::ostream& os, ConfirmationSender& T)
	{
		/*T.display(os);
		return os;*/
		os << "--------------------------\n";
		os << "Confirmations to Send\n";
		os << "--------------------------\n";
		if (T.m_noOfcon == 0)
		{

			os << "There are no confirmations to send!\n";
			os << "--------------------------\n";
		}
		else
		{
			for (size_t i = 0; i < T.m_noOfcon; i++)
			{
				if (T.m_con[i] != nullptr)
				{
					os << *T.m_con[i];
				}

			}
			os << "--------------------------\n";
		}
		return os;
	}




}
