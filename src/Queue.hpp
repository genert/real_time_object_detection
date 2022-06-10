#ifndef WorkQueue_hpp
#define WorkQueue_hpp

#include <list>
#include <mutex>
#include <condition_variable>

class PacketItem {
    std::vector<char> mPacket;
    int mType;
    int mTag;

public:
    PacketItem(std::vector<char> packet, int type, int tag) : mPacket(packet), mType(type), mTag(tag) {}

    std::vector<char> getPacket() {
        return mPacket;
    }

    int getType() {
        return mType;
    }

    int getTag() {
        return mTag;
    }

    int size() {
        return mPacket.size();
    }
};

template<typename T>
class WorkQueue {
    // The Queue that will contain the work items
    std::list<T> m_queue;

    // The mutext that we'll use to lock access to the queue
    std::mutex mMutex;

    // The Condition variable that determines when remove() can stop
    // waiting because there is either a new item in the queue, or
    // the queue should stop.
    std::condition_variable mConditionVariable;

    // Whether the queue should stop.
    // This is required because there was an deadlock issue where trying to
    // stop an std::thread that is waiting on a std::condition_variable to
    // return.
    // This stackoverflow question explains in more detail
    // https://stackoverflow.com/q/21757124
    std::atomic_bool m_shouldStop = false;

public:

    WorkQueue() {
    }

    ~WorkQueue() {
    }

    void add(T item) {
        if (m_shouldStop) {
            return;
        }
        mMutex.lock();
        m_queue.push_back(item);
        mConditionVariable.notify_all();
        mMutex.unlock();
    }

    T remove() {
        std::unique_lock<std::mutex> lock(mMutex);

        mConditionVariable.wait(lock, [&]() { return m_shouldStop || !m_queue.empty(); });

        if (m_queue.size() > 0) {
            T item = m_queue.front();
            m_queue.pop_front();
            lock.unlock();
            return item;
        } else {
            lock.unlock();
            return NULL;
        }

    }

    int size() {
        mMutex.lock();
        int size = m_queue.size();
        mMutex.unlock();
        return size;
    }

    void stop() {
        m_shouldStop = true;
        mConditionVariable.notify_all();
    }
};

#endif