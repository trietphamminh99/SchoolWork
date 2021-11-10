#pragma once
#ifndef COLLECTION_H
#define COLLECTION_H
#include <string>
using namespace std;
namespace sdds {

	template <typename T>
	class Collection {
		string m_colName{};
		T* m_colArray{};
		size_t m_colArrayNum = 0;
		void (*funPtr)(const Collection<T>&, const T&) { nullptr };
	public:
		
		Collection(const std::string& name) {
		
			m_colName = name;
			m_colArray = nullptr;
			funPtr = nullptr;
		}
		 ~Collection()
		{
			 delete[]  m_colArray;
			 m_colArray = nullptr;
		};
		const std::string& name() const {
			return m_colName;

		}
		size_t size() const {
			return m_colArrayNum;
		}
		void setObserver(void (*observer)(const Collection<T>&, const T&))
		{
			funPtr = observer;
		}
		Collection<T>& operator+=(const T& item) {
			//find the exiting title 
			bool exit = false;
			for (unsigned int i =0;i < m_colArrayNum; i++)
			{
				if (m_colArray[i].title() == item.title())
				{
					exit = true; 
				}
			}
			
			
			if (m_colArrayNum == 0)
			{
				m_colArrayNum++;
				m_colArray = new T[m_colArrayNum];
				m_colArray[m_colArrayNum - 1] = item;

			}
			else {
				if (exit == false)
				{
					T* temp = new T[m_colArrayNum];
					for (size_t i = 0; i < m_colArrayNum; i++)
					{
						temp[i] = m_colArray[i];
					}
					delete[] m_colArray;
					m_colArrayNum += 1;
					m_colArray = new T[m_colArrayNum];
					for(size_t j = 0; j < m_colArrayNum-1; j++)
					{
						m_colArray[j] = temp[j];
					}
					m_colArray[m_colArrayNum - 1] = item;
					delete[] temp;
					if (funPtr != nullptr)
					funPtr(*this, item);
				}
				
			}
			return *this;
		}
		T& operator[](size_t idx) const
		{
			
			
				
					if (idx >= m_colArrayNum )
					{
						throw std::out_of_range("Bad index [" + to_string(idx) + "]. Collection has [" + to_string(m_colArrayNum) + "] items.");
					}
					else {
						return	m_colArray[idx];
						
					}
				
				
		}
		T* operator[](const std::string& title) const
		{
			size_t j = 0;
			
			for (size_t i = 0; i < m_colArrayNum; i++)
			{
				if (m_colArray[i].title() == title)
				{
					j = i;
					
				}
			}
			if (j == 0)
			{
				return nullptr;
			}
			else 
			{

				return &m_colArray[j];
			}
			
		}

		
		friend ostream& operator<<(ostream& os, Collection& Ttem)
		{
			for (size_t i = 0; i < Ttem.size(); i++)
			{
				os << Ttem.m_colArray[i];
			}
			return os;
		}
	};

}




#endif//COLLECTION_H
