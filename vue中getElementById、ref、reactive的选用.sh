vue中getElementById、ref、reactive的选用

#getElementById
无法在开头初始化dom，在watch中使用时需要结合onMounted中绑定，比较复杂
#ref
开头可以直接绑定dom，不需要涉及onMounted，在watch中可直接使用
#reactive
开头的声明无法正常绑定dom，需要在onMounted中再次绑定，比较复杂

注意：不管使用哪个，使用前判断dom存在都是必要的