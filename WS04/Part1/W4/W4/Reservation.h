#ifndef RESERVATION_H
#define RESERVATION_H
#include <string>
using namespace std;
namespace sdds {

	class Reservation{
		
		 char* m_id{ nullptr };
		string m_name;
		string m_email;
		unsigned int m_day{0};
		unsigned int m_hours{0};
		unsigned int m_people{0};
		int countString(int start, string mainString);
		
	public:
		
	
		Reservation();
		Reservation(const std::string& res);
		std::ostream& display(std::ostream& os )const;



	};
	std::ostream& operator<<(std::ostream& os, const Reservation& T);
}





#endif // !RESERVATION_H

