import random

random.seed()

set_ = {'a': 10, 'b': 5}
set_r = {'a': 2, 'b': 4}

def exp():
    _set_ = set_.copy()
    set_n = {'a': 0, 'b': 0}
    for i in range(6):
        a_mult = _set_['a']
        b_mult = _set_['b']
        if random.randint(1, a_mult + b_mult) <= a_mult:
            set_n['a'] += 1
            _set_['a'] -= 1
        else:
            set_n['b'] += 1
            _set_['b'] -= 1
    return set_n

count_win = 0
count_exp = 0
for i in range(1000000):
    if exp() == set_r:
        count_win += 1
    count_exp += 1
print(count_win / count_exp)
