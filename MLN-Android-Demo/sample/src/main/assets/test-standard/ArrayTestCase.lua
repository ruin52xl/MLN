---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Feng.
--- DateTime: 2019-04-18 12:47
---

require("../Test")

test = Test()

--- case Array:size()
array1 = Array()
test:assert(array1:size() == 0, "Array:size()")

---- case Array:add()
array2 = Array()
array2:add(100)
test:assert(array2:size() == 1, "Array:add()")

---- case Array:get()
array3 = Array()
array3:add(100)
test:assert(array3:get(1) == 100, "Array:get()")

--- case Array:addAll()
array4 = Array()
otherArray1 = Array()
otherArray1:add(200)
array4:addAll(otherArray1)
test:assert(array4:size() == 1, "Array:addAll()")

---- case Array:remove()
array5 = Array()
array5:add(100):add(200)
array5:remove(2)
test:assert(array5:size() == 1 and array5:get(1) == 100, "Array:remove()")


---- case Array:removeObject()
array6 = Array()
array6:add(100):add(200)
array6:removeObject(100)
test:assert(array6:size() == 1 and array6:get(1) == 200, "Array:removeObject()")


---- case Array:removeObjects()
otherArray2 = Array()
otherArray2:add(100):add(200)
array7 = Array()
array7:add(100):add(200)
array7:removeObjects(otherArray2)
test:assert(array7:size() == 0, "Array:removeObjects()")


---- case Array:removeObjectsAtRange()
array8 = Array()
array8:add(100):add(200)
array8:removeObjectsAtRange(1, 2)
test:assert(array8:size(), "Array:removeObjectsAtRange()")

---- case Array:removeAll()
array9 = Array()
array9:add(100):add(200)
array9:removeAll()
test:assert(array9:size() == 0, "Array:removeAll()")


---- case Array:get()
array10 = Array()
array10:add(100):add(200)
test:assert(array10:get(2) == 200, "Array:get()")


---- case Array:contain()
array11 = Array()
array11:add(100):add(200)
test:assert(array11:contains(100), "Array:contain()")


---- case Array:insert()
array12 = Array()
array12:insert(1, 100)
test:assert(array12:size() == 1 and array12:get(1) == 100, "Array:insert()")

---- case Array:insertObjects()
otherArray3 = Array()
otherArray3:add(100):add(200)
array13 = Array()
array13:insertObjects(1, otherArray3)
test:assert(array13:size() == 2 and array13:get(1) == 100 and array13:get(2) == 200, "Array:insertObjects()")

---- case Array:replace()
array14 = Array()
array14:add(100):add(200)
array14:replace(1, 200)
test:assert(array14:size() == 2 and array14:get(1) == 200, "Array:replace()")


---- case Array:replaceObjects()
otherArray4 = Array()
otherArray4:add(300)
otherArray4:add(400)
array15 = Array()
array15:add(100):add(200)
array15:replaceObjects(1, otherArray4)
test:assert(array15:size() == 2 and array15:get(1) == 300 and array15:get(2) == 400, "Array:replaceObjects()")

---- case Array:exchange()
array16 = Array()
array16:add(100):add(200)
array16:exchange(1, 2)
test:assert(array16:size() == 2 and array16:get(1) == 200 and array16:get(2) == 100, "Array:exchange()")

test:analysis()

local timer = Timer()
timer:interval(5)
timer:start(function(completed)
    print('---timer print')
end)