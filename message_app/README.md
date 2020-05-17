# message_app

Flutter代码分层框架示例。采用类似Java的Spring框架的代码结构，针对Flutter做了些许调整，对于具体的功能模块，代码目录结构统一如下所示：

- pages: 代表具体的页面;
- view_model: 视图与业务交互层，包括状态管理（使用Provider），调用业务层代码组装成页面视图模型;
- service: 抽象业务接口定义，用于解耦view_model与实现类，使得view_model无需关心具体的实现;
- impl: 抽象业务接口的实现类，最终通过容器GetIt管理组件注入到view_model使用;
- models: 数据实体类，一般用于从api接口或本地数据库将Map类转成对象
- components: 当前模块特有的组件。

## 如何使用

- 合理设计你的业务代码模块，不同业务间尽量不要有耦合;
- 按上述的分层编写你的代码;
- 在上层的repository中调用GlobalServiceRepository注册对应service的实现类实例;
- 在view_model中通过GlobalServiceRepository的getService方法获取所需要的service实现类示例;

## 已完善

- 业务代码分层解耦
- 全局容器管理 (使用GetIt)
- 全局异常捕获管理（使用Catcher）
- 全局路由配置 (使用fluro)
- 网络请求封装（使用dio）
- 网络图片加载 (使用cached_network_image)
- 上拉加载和下拉刷新（flutter_easyrefresh）

## 待完善

- 统一日志管理
- 统一异常上报
- 注解
