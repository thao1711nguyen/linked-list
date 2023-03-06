class Linkedlist
    attr_accessor :node
    def initialize
        @node = Node.new
    end 
    def append(value)
        temp = @node
        while temp.next_node != nil
            temp = temp.next_node
        end 
        if temp.value == nil 
            temp.value = value
            return
        end
        new_node = Node.new(value)
        temp.next_node = new_node 
    end 
    def prepend(value)
        @node = Node.new(value,@node)
    end 
    def size
        count = 1
        temp = @node
        while temp.next_node != nil
            count += 1
            temp = temp.next_node
        end
        count
    end 
    def head 
        @node
    end 
    def tail 
        temp = @node
        while temp.next_node != nil
            temp = temp.next_node
        end
        temp        
    end 
    def at(index)
        count = 0
        temp = @node
        while index != count 
            if temp.next_node == nil
                return nil 
            else 
                temp = temp.next_node
            end 
            count += 1
        end
        temp
    end 
    def pop 
        last = self.at(size-2)
        last.next_node = nil
    end 
    def contains?(value)
        count = 1
        result = false 
        temp = @node
        while count <= self.size
            if temp.value == value
                return true
            end 
            count += 1
            temp = temp.next_node
        end
        result  
    end 
    def find(value)
        count = 0
        temp = @node 
        while count <= self.size-1
            if temp.value == value
                return count
            end
            count += 1
            temp = temp.next_node
            if count > self.size-1 
                return nil 
            end 
        end 
    end 
    def to_s
        temp = @node
        while temp.next_node != nil 
            print "( #{temp.value} ) -> "
            temp = temp.next_node
        end 
        print "( #{temp.value} ) -> nil"
        puts 
    end 
    def insert_at(value, index)
        temp = self.at(index)
        new_node = Node.new(value, temp)
        self.at(index-1).next_node = new_node
    end 
    def remove_at(index)
        self.at(index-1).next_node = self.at(index+1)
    end 
end

class Node 
    attr_accessor :value, :next_node
    def initialize(value=nil,next_node=nil)
        @value = value
        @next_node = next_node
    end 
end 

a = Linkedlist.new
a.append(2)
a.append(3)
a.append(4)
a.prepend(1)
a.insert_at(1.5,1)
a.remove_at(2)
p a.size
p a.to_s

