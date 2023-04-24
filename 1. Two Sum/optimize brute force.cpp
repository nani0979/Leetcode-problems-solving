class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        vector<int> ans;
        int numSize = nums.size();
        unordered_map<int,int> _map;
        for(int i=0; i< numSize; i++){
            if(_map.find(target - nums[i])!= _map.end()){
                ans.push_back(i);
                ans.push_back(_map[target - nums[i]]);
                return ans;
            }
            _map[nums[i]] = i;
        }
        return ans;
    }
};