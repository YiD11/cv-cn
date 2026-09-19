// For more customizable options, please refer to official reference: https://typst.app/docs/reference/

// Latin-only fonts lack CJK glyphs, so Chinese falls back to the second family in each font list
#show heading: set text(font: ("Linux Biolinum", "Heiti SC"))

#show link: underline

// The recommend resume text size is from `10pt` to `12pt`
#set text(
  font: ("Libertinus Serif", "Songti SC"),
  size: 11pt,
  lang: "zh",
  region: "cn",
)

// Feel free to change the margin below to best fit your own CV
#set page(
  margin: (x: 0.9cm, y: 1.3cm),
)


#set par(justify: true)

#let chiline() = { v(-3pt); line(length: 100%); v(-5pt) }

#let continuescvpage() = {
  place(
    bottom + center,
    dx: 0pt,        // Horizontal offset (positive is rightward)
    dy: -10pt,      // Vertical offset (positive moves upwards)
    float: true,
    scope: "parent",
    [
      #text(fill: gray)[... continues on the next page ...]
    ]
  )
}

#let lastupdated(date) = {
  h(1fr); text("Last Updated in " + date, fill: color.gray)
}

#let svg-fix(path, color: black) = bytes(
  read(path)
    .replace("height=\"1em\"", "")
    .replace("width=\"1em\"", "")
)

#let volcengine-logo(size: 2em, color: black) = box(baseline: 20%, grid(
  columns: 2,
  column-gutter: size * 0.2,
  align: horizon,
  image(svg-fix("../assets/volcengine-color.svg", color: color), format: "svg", height: size),
  image(svg-fix("../assets/volcengine-text.svg", color: color), format: "svg", height: size * 0.8),
))

// Uncomment the following lines to add the optional prompt at the bottom of the first CV page
// #continuescvpage()

= 张怡丰

yid11\@outlook.com | (+86)15015799698 | #link("https://github.com/YiD11")[github.com/YiD11]

== 学业信息
#chiline()

=== #block[
  #place(right + horizon, dy: +10pt, dx: -100pt, image("../assets/buaa.svg", height: 4em))
  #grid(
    columns: (1fr, 1fr),
    align: (left + horizon, right + horizon),
    [北京航空航天大学 | 985],
    [2025/09 -- 2028/05],
  )
]

软件工程硕士 \
RAIDS-LAB & ACT实验室 \
导师：胡春明 & 沃天宇

=== #block[
  #place(right + horizon, dy: +10pt, dx: -100pt, image("../assets/scnu.svg", height: 4em))
  #grid(
    columns: (1fr, 1fr),
    align: (left + horizon, right + horizon),
    [华南师范大学 | 211],
    [2021/09 -- 2025/06],
  )
]

数据科学与大数据技术学士

== 实习经历
#chiline()

=== #block[
  #place(right + horizon, dx: -100pt, image("../assets/meituan.png", height: 2.4em))
  #grid(
    columns: (1fr, 1fr),
    align: (left + horizon, right + horizon),
    [美团计算与智能平台 | 机器学习平台研发实习生],
    [2026/02 -- 2026/05],
  )
]

- 参与平台业务功能迭代，包含作业回收挂起策略、基础镜像迭代等。
- 参与Kubernetes源码改造，优化集群内上万作业的Service访问性能。

=== #block[
  
  #place(right + horizon, dx: -100pt, volcengine-logo(size: 2.4em))
  #grid(
    columns: (1fr, 1fr),
    align: (left + horizon, right + horizon),
    [字节跳动火山引擎平台架构 | Golang服务端开发实习],
    [2025/03 -- 2025/07],
  )
]

- 火山引擎自研Salesforce CRM海内外经营平台服务端开发。
- 海内外系统合并，功能重构，用户主页模块化、产品信息国际化等。
- 服务治理和观测优化，系统初版埋点策略和指标采集。
- ORM查询配置化与低代码化，实现多个页面的报表*近零代码开发*。

== 开源项目
#chiline()

=== Crater | 基于Kubernetes的云原生智能计算平台，核心成员 #h(1fr) #link("https://github.com/raids-lab/crater")[github.com/raids-lab/crater]
基于Kubernetes的云原生异构集群资源管理平台。系统管理集群内CPU与内存资源，以及NVIDIA GPU和Ascend加速卡等异构硬件。系统提供Jupyter等多类型作业容器化管理与调度、深度学习环境管理、多租户资源隔离、监控与模型/数据管理等功能。项目技术栈涉及前后端开发、Kubernetes、Volcano等。\
个人贡献：
- 负责日常Crater前后端系统迭代开发，日常维护学院的Kubernetes百卡异构集群。
- 基于Volcano调度系统，使用层级队列实现多租户层级资源配额，实现课题组间多租户层级资源配额调整。
- 为实现回填抢占与队列内资源配额自定义逻辑，改造Volcano调度逻辑，优化核心作业Controller，设计并实现系统预排队调度机制。
- 针对项目遭遇的问题，反馈并参与Volcano社区的问题和特性维护。

== 科研论文
#chiline()

- J. Wang, *Y. Zhang*, et.al, \"SagePilot: Latency-Aware Orchestration for Multi-Agent LLM Workflows on Heterogeneous GPUs,\" PPoPP, 2027 (CCF A会议) \
  在异构GPU集群的多智能体工作流场景中，提出一个基于模型执行图感知的智能体推理和模型部署的调度编排系统。在多智能体工作流和模型推理服务分离的基础上，引入模型预加载、驱逐和调用融合等机制。使用GNN预测器准确预测智能体在各种异构GPU上的多项推理性能开销，提供集群动态状态、模型信息和工作流依赖关系的联合优化调度策略。相比类似工作，系统在突发负载下将端到端Makespan和p95延迟分别降低了36.8%和25.9%，显著提升了异构GPU资源利用率。 \ 
  个人贡献：模型核心idea与系统实现，实验，论文的算法、核心架构和实验章节撰写 \
  技术栈：PyTorch、vLLM、Ray

- *Y. Zhang*, Q. Xi\*, J. Wang and S. Gu, \"Architecture and Algorithm Design for Civil Aviation Data Real-time Analysis System,\" IEEE _Access_. Available online: #link("https://ieeexplore.ieee.org/document/10497583")[ieeexplore.ieee.org/document/10497583]. (本科期间工作，与中国商飞公司合作) \
  技术栈：Flink、Kafka、PyTorch
  
- *Y. Zhang*, J. Wang, Q. Wang, Q. Xi, C. Ma and B. Zhu, \"Parallel Decoding for Massive Amount of Real Time Flight Data,\" 2023 6th International Conference on Electronics Technology (ICET). (本科期间工作，与中国商飞公司合作)

== 个人项目
#chiline()

=== Minitorch微型深度学习框架 #h(1fr) #link("https://github.com/YiD11/minitorch")[github.com/YiD11/minitorch]

一个使用Python实现的微型深度学习框架，实现Tensor类和常见算子的前向反向传播，支持张量广播和自动微分，支持Numba和CUDA加速算子，并在各项单元测试和MNIST数据集上验证梯度传播和模型训练正确性。

=== Stanford CS 336课程实验 #h(1fr) #link("https://github.com/YiD11/stanford-cs336")[github.com/YiD11/stanford-cs336]
完成课程内容和各项课程作业，实现BPE（Byte Pair Encoding）分词器，构建以Qwen2为原型的Transformer模型，使用Triton实现FlashAttention前向和反向传播算法，构建分布式数据并行模型训练过程。

=== Simple vLLM #h(1fr) #link("https://github.com/YiD11/simple-vllm")[github.com/YiD11/simple-vllm]
一个从零实现的轻量级大模型推理与Serving引擎，深入复现vLLM的核心显存管理与调度机制，基于PagedAttention设计显存块管理器，构建逻辑与物理KV Cache块映射表，实现显存按块管理，同时支持KV缓存Offloading；实现Continuous Batching调度器与请求状态机，支持Prefill与Decode阶段的动态混合批处理及显存按需抢占与回收；基于FastAPI构建异步服务层，适配OpenAI兼容的Server-Sent Events流式响应接口。


== 竞赛经历
#chiline()

- 2020 广东省NOIP提高组(CSP-S)二等奖 #h(1fr) 证书编号：CCF-CSP-JS2020-01838
- 2023 全国大学生数学建模竞赛广东省一等奖 #h(1fr) 证书编号：2304010751
- 2022 第十届“泰迪杯”数据挖掘挑战赛全国本科组一等奖 #h(1fr) 证书编号：TZ2022002265

// Feel free to change the date below to the last time you updated your CV
#lastupdated("Sep 19, 2026")
