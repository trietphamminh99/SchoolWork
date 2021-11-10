#ifndef ADD_H
#define ADD_H
//PHAM MINH TRIET
//ID:157930199

extern unsigned int g_sysClock;
namespace sdds
{


	class Event
	{




		char* description; //description of the event
		unsigned int secMidnight; //seconds after midnight


	public:
		Event(); //constructor
		~Event();
		void display();
		void set(const char* src);
		void set();





	};






}
#endif