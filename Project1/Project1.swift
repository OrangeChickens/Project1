func nextCellStates(currentStates: [[Bool]]) -> [[Bool]] {
    // IMPLEMENT ME
    // Take a look at https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life for the rules
    func ValidEntry(row m:Int, Col n: Int) ->Bool {
        return m >= 0 && m < currentStates.count && n >= 0 && n < currentStates[1].count;
    }
    var new: [[Bool]] = currentStates
    for i in 0..<new.count {
        for j in 0..<new[i].count {
            var livingCell: Int = 0;
            for k in (i-1)...(i+1) {
                for m in (j-1)...(j+1) {
                    if ( !((k == i) && (m == j)) && ValidEntry(row: k, Col: m)) {
                        if(currentStates[k][m] == true) {
                            livingCell++;
                        }
                    }
                }
            }
            if(new[i][j] == true && livingCell < 2) {
                new[i][j] = false;
            }
            if(new[i][j] == true && livingCell > 3) {
                new[i][j] = false;
            }
            if(new[i][j] == false && livingCell == 3) {
                new[i][j] = true;
            }
            if(new[i][j] == true && (livingCell  == 3 || livingCell == 2)) {
                new[i][j] = true;
            }
            
            
        }
    }
    
    return new
    
}

class LRUCache<K:Hashable, V> {
    private var capacity: Int
    private var count = 0
    private var dict = [K:V]()
    private var LRUDic = [Int:K]()
    private var tracker = 1
    private var temp = 1
    
    init(capacity: Int) {
        self.capacity = capacity
    }
    
    func get(k: K) -> V? {
        // IMPLEMENT ME
        
        /*
        *  Get the value of the key if the key exists in the cache, otherwise return nil.
        */
        if(self.dict[k] != nil){
            return dict[k]
        }
        else{
            return nil
        }
    }
    
    func set(k: K, v: V) {
        // IMPLEMENT ME
        
        /*
        * Set or insert the value if the key is not already present.
        * When the cache reached its capacity, it should invalidate the
        * least recently used item before inserting a new item.
        */
        if (count == capacity){
            print(LRUDic[tracker])
            dict.removeValueForKey(LRUDic[tracker]!)
            count--
        }
        if(self.dict[k]==nil) {
            self.dict[k] = v
            count++
            LRUDic[temp] = k
            temp++
        }
        
        
        
        
    }
}