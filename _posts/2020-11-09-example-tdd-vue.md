---
layout: post
title: Basic TDD with Vue
tags: vuejs, tdd
author: Sebastian Peralta
---

TDD is a practice where you write test before code, this with the end of have the best product possible, the advantage has it is forces you to think before you code. the cycle of TDD is the next:

  1. you describe a test which an expected behaivor. (it is will fail)
  2. you write code simple that solution the test.
  3. refactor code for to make rigth.

quick example (vue, jest):

- We will create a component in vue that displays a list of colors. The first thing to do would be to write the proof corresponding to this logic:

``` 
import { shallowMount } from '@vue/test-utils'
import colors from '@/components/colors'
import convert from 'color-convert'

let wrapper = null

const propsData = {
  colors: ['e3342f', '3490dc', 'f6993f', '38c172', 'fff']
}

beforeEach(() => (wrapper = shallowMount(colors, { propsData })))
afterEach(() => wrapper.destroy())

describe('colors', () => {
  describe('colors', () => {
    test('displays each color as an individual ', () => {
      const colors = wrapper.findAll('.color')
      propsData.colors.forEach((color, index) => {
        expect(colors.at(index).attributes().style).toBe(
          `background: rgb(${convert.hex.rgb(color).join(', ')})`
        )
      })
    })
  })
})
```
this will fail as colors is empty.

- now we have to make the test pass, for this we will use a simple code base that solves the test:

``` 
<ul class="colors">
  <li class="color" style="background: rgb(227, 52, 47);"></li>
  <li class="color" style="background: rgb(52, 144, 220);"></li>
  <li class="color" style="background: rgb(246, 153, 63);"></li>
  <li class="color" style="background: rgb(56, 193, 114);"></li>
  <li class="color" style="background: rgb(255, 255, 255);"></li>
</ul>
```

- with this when executing the test there will be no errors since it complies with what is described above. finally we will refactor the code in such a way that it meets our expectations and has the best performance:

```
<template>
  <div class="color-picker">
    <ul class="colors">
      <li
        :key="index"
        v-for="(color, index) in colors"
        :style="{ background: `#${color}` }"
        class="color"
      ></li>
    </ul>
  </div>
</template>

<script>
export default {
  props: {
    colors: {
      type: Array,
      default() {
        return []
      }
    }
  }
}
</script> 
```

Remember that this is a very basic example which only seeks to give a more graphic example of TDD in Vue for more complete information about you can see the following article [An Introduction to TDD with Vue.js](https://frontstuff.io/an-introduction-to-tdd-with-vuejs)
