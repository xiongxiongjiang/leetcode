const twoSum = (nums: number[], target: number)  =>  {
  const sumMap = new Map()
  let res: number[] = []
  for (let i = 0; i < nums.length; i++) {
    const val = nums[i]
    if (sumMap.has(target - val)) {
      const lasti = sumMap.get(target - val)
      res = [i, lasti]
      break
    }
    sumMap.set(val, i)
  }
  return res
}

const nums = [3, 3]
const a = twoSum(nums, 6)
console.log(a)
