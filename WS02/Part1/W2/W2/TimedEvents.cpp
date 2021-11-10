#define _CRT_SECURE_NO_WARNINGS
#include "TimedEvents.h"
#include <iostream>
#include <cstring>
#include  <thread>
#include <chrono>
using namespace std;
namespace sdds {
	size_t TimedEvents::e_storded = 0;

	TimedEvents::TimedEvents() : eventStartTime{}, eventEndTime{}
	{

	}

	void TimedEvents::startClock()
	{
		eventStartTime = chrono::high_resolution_clock::now();
		
	}

	void TimedEvents::stopClock()
	{
		eventEndTime = chrono::high_resolution_clock::now();
	}


	void TimedEvents::addEvent(const char* val)
	{
		if (val != nullptr)
		{
			
			Event[e_storded].e_Name = new char(strlen(val) + 1);
			strcpy(Event[e_storded].e_Name, val);
			
			Event[e_storded].t_Units = "nanoseconds";
			Event[e_storded].duration = eventEndTime - eventStartTime;
			e_storded++;
		}
		else
		{
			Event[e_storded].e_Name = new char[strlen("NO_EVENT_STORED") + 1];
			strcpy(Event[e_storded].e_Name, "NO_EVENT_STORED");
			strcpy(Event[e_storded].e_Name, "Null");
		}
		
	}

	TimedEvents::~TimedEvents()
	{
		
	}

	void TimedEvents::draw(std::ostream& os) const
	{
		os << "Execution Times:\n";
		os << "--------------------------\n";
		for (unsigned int i=0; i < e_storded; i++)
		{
			os.width(21);
			os.left;
			os << Event[i].e_Name ;
			os.width(13);
			os.right;
			os << chrono::duration_cast<chrono::nanoseconds>(Event[i].duration).count();
			os << " " << Event[i].t_Units;
			os << "\n";
		}
			os << "--------------------------\n";


		
	}


	



	std::ostream& operator<<(std::ostream& os, TimedEvents& timeOb)
	{
		timeOb.draw(os);
		return os;
	}



}