<template>
  <a-table
    :columns="columns"
    :data-source="data"
    :pagination="false"
    bordered>
    <template slot="name" slot-scope="text">
      <a>{{ text }}</a>
    </template>
  </a-table>
</template>
<script>
const renderContent = (value) => {
  const obj = {
    children: value,
    attrs: {},
  };
  return obj;
};

const fieldMap = {
  order_uid: '订单号',
  order_name: '订单名称'
}

export default {
  name: 'Table',
  data() {
    return {
      originalData: {
        condition: [
          {
            opt: 'or',
            condition: [
              ['order_uid', 'like', '24'],
              ['order_name', '=', '2']
            ]
          },
          {
            opt: 'and',
            condition: [
              ['order_name', 'like', '22'],
              ['order_uid', 'like', '2233'],
              ['order_uid', 'like', '24']
            ]
          },
          {
            opt: 'and',
            condition: [
              ['order_name', 'like', '22'],
              ['order_uid', 'like', '2233'],
              ['order_uid', 'like', '24']
            ]
          }
        ],
        opt: 'or'
      },
      data: [],
      columns: [],
    };
  },
  mounted() {
    this.process()
  },
  methods: {
    process() {
      const conditionGroups = this.originalData.condition
      let attrs = []
      for (let i = 0; i < conditionGroups.length; i++) {
        let conditionGroup = conditionGroups[i]
        let conditionGroupOpt = conditionGroup.opt
        let conditions = conditionGroup.condition
        let conditionsLen = conditions.length
        for (let j = 0; j < conditionsLen; j++) {
          let condition = conditions[j]
          this.data.push({
            field: fieldMap[condition[0]], // order_uid，将 field 转成实际名称
            action: condition[1], // like
            value: condition[2], // 24
            opt: conditionGroupOpt // or|and
          })

          if (j === 0) {
            attrs.push({
              rowSpan: conditionsLen
            })
            continue
          }
          attrs.push({
            rowSpan: 0
          })
        }
      }

      this.columns = [
        {
          title: 'Field',
          dataIndex: 'field',
          customRender: renderContent,
        },
        {
          title: 'Action',
          dataIndex: 'action',
          customRender: renderContent,
        },
        {
          title: 'Value',
          dataIndex: 'value',
          customRender: renderContent,
        },
        {
          title: 'Opt',
          dataIndex: 'opt',
          customRender: (value, row, index) => {
            const obj = {
              children: value,
              attrs: attrs[index],
            };
            return obj;
          },
        },
      ]
    }
  },
};
</script>
