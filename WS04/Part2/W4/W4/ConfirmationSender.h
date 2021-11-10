#ifndef CONFIRMATIONSENDER_H
#define CONFIRMATIONSENDER_H
using namespace std;
//PHAM MINH TRIET
//ID:157930199
#include <iostream>
namespace sdds{
class Reservation;

	class ConfirmationSender {
		const Reservation** m_con{ nullptr };
		size_t m_noOfcon =0;

	public:
		ConfirmationSender() {};
		
		friend std::ostream& operator<<(std::ostream& os,ConfirmationSender& T);
		ConfirmationSender& operator+=(const Reservation& res);
		ConfirmationSender& operator-=(const Reservation& res);
		
		//copy constructor and assignment 
		ConfirmationSender(const ConfirmationSender& val);
		ConfirmationSender& operator= (const ConfirmationSender& val);

		//move constructor and assignment
		ConfirmationSender(ConfirmationSender&& val)noexcept;
		/*ConfirmationSender& operator=(ConfirmationSender&& val);*/
	
		virtual ~ConfirmationSender();
	};

}

#endif // !CONFIRMATIONSENDER_H

