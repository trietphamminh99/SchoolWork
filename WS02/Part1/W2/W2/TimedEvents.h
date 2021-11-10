#ifndef TIMEDEVENT_H
#define TIMEDEVENT_H
#include <iostream>
#include <thread>
#include <chrono>

using namespace std;
namespace sdds {

	class TimedEvents {
		
		
		std::chrono::time_point<chrono::steady_clock> eventStartTime, eventEndTime;
		static unsigned int e_storded;
		struct  {
			char* e_Name{ nullptr };
			string t_Units;
			std::chrono::duration<double, std::milli> duration;
			
		}Event[20];
	public:
		TimedEvents();
		
		void startClock();
		void stopClock();
		
		virtual void draw(std::ostream& os)const;
		void addEvent(const char* val);
		~TimedEvents() ;
		friend std::ostream& operator<<(std::ostream& os,TimedEvents& timeOb);
	};


}


#endif // TIMEEVENT_H

