# display-condition-groups

使用 [Ant Design Vue](https://antdv.com) 的 [Table](https://antdv.com/components/table-cn/) 组件展示条件组。

点击查看 [Demo](https://k8scat.github.io/display-condition-groups/)

## 原始数据

```json
{
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
}
```
