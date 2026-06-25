# Google Cloud Summit Sydney — Day Summary
**25 June 2026**

---

## Morning Keynotes

### Opening Keynote — Paul Migliorini, VP Google Cloud AUNZ
Paul set the scene by framing the past twelve months as "unfathomable" change. The headline stat: Google went from **9.7 trillion tokens/month** (May 2022) → **480 trillion** (May 2023) → **3.2 quadrillion today** — a 326× increase. The message was clear: this is not incremental. He grounded it in Australian impact stories:
- **Waymo** — 500,000 driverless taxi rides across 10 cities
- **ReachOut** — mental health chatbot serving 16,000 Australians
- **Canva** — global creative platform
- **Shopping Lens** (launched last month in AU) — snap a photo, get product recommendations, virtually try on clothes or preview furniture

> *"Success should be measured through results."*

---

### Francis deSouza — The Agentic Era
Francis declared we have entered the **Agentic Era**, where AI agents transform industries at scale. Key claim: 75% of top-performing customers are now seeing measurable AI benefits.

**ANZ examples highlighted:**
- **Liam / Birdie** (Woolworths) — Intelligent shopping assistant built in just 6 weeks using Gemini Enterprise CX; moves beyond cart-filling to actual meal planning
- **Woolworths' Ollie** — Transformed into an agentic assistant
- **NASA Artemis 2** — Gemini Enterprise agents used for flight readiness and astronaut safety

**The Gemini Enterprise Agent Platform** was positioned as the end-to-end system connecting data, people, and goals:
- **Agent Studio** — low-code, anyone can build agents
- **Agent Registry** — single control point across the organisation
- **Model Garden** — 200+ models including Gemini 3.5

---

### Emily Qiao (Google Cloud) — Agents in Action (Live Demo)
A live demo using "Simple Outdoors" (an outdoor gear retailer):
- A **multi-agent system** in Agent Studio — catalog agent, legal compliance agent, marketing agent — collaborating to enrich a product page
- Output: richer descriptions, 360° views, audio summaries, grounded sources
- Customer-facing: "Ask me anything" answered a family hike recommendation using a YouTube video for terrain analysis
- Key takeaway: agents move AI from demo to real deployment

---

### AI Stack Announcement — Google Cloud Architecture Overview
Google positioned itself as the **only provider with first-party solutions across the full AI stack**:
1. **AI Hypercomputer** (TPU HT + AI chips)
2. **Research & Frontier Models**
3. **Agentic Data Cloud** — enterprise data platform becomes a reasoning engine
4. **Agentic Defense** — security layer
5. **Agent Platform** — centralised control plane
6. **Agents & Applications**

Notable: **Borderless Cross-Cloud Linkage** (Apache Iceberg) — low-latency direct connectivity to AWS and Azure with zero data egress fees.

---

### Transurban — Ashish Khurana, Chief Data & AI Officer
A grounded example of AI at scale in infrastructure:
- 32 toll roads globally, 2.6M trips/day, 11.3M customers
- Saving **AUD $2.3M in time and fuel per workday** in Australia alone
- **Everyday AI**: Gemini Enterprise deployed to 60%+ of employees, 82% adoption rate
- **Operational AI**: Vision AI for traffic management, Google Maps for journey guidance
- **Transformative AI**: New customer experiences built with AI-augmented coding tools

> *"We even get emails saying 'Oh my god, I love you!'"* — on helping stranded customers

---

### Security Keynote
- Security incident handover time has dropped from **3 hours → 22 seconds** in 3 years
- Automated triage agents turn **30-minute investigations into 1-minute resolutions**
- **98% accuracy** on dark web threat identification
- **Macquarie Bank** case study: uses Google Enterprise Plan Plus + Mandiant threat intelligence
- Key concept: **Shadow AI** — unauthorised models operating inside enterprise perimeters — is now a major threat vector
- **Wiz + Google Cloud** announced as a unified platform: code → runtime security

---

### Atlassian — Sherif Mansour
Atlassian's thesis: *"If intelligence is abundant, what makes a business differentiated? Your context."*

- Built the **Teamwork Graph** — every Jira ticket, Confluence page, code commit, project, person — unified context
- **Rovo Agent** + Splunk integration: security vulnerabilities automatically create prioritised Jira tickets across hundreds of teams' backlogs, with human-like agents that can pick up and act on them

---

### Ian Thorpe + ReachOut — Scaling Mental Health with AI
The most emotionally resonant session of the morning:
- Ian shared his personal mental health struggles as an Olympic athlete
- **40%** of young Australians experience mental health challenges; over **1 million** don't access traditional support (barriers: wait times, embarrassment, geography)
- **Ask ReachOut** — Gemini-powered chatbot drawing from 600+ evidence-informed resources
- Since March launch: **~160 inquiries/day**, **16,000 people served**

> *"Great technology is only as impactful as the people who wield it."*

---

## Afternoon: Data Track Sessions

### Setting the Stage with IAG — Is Your Data Platform Ready for the Agentic Shift?
Three fundamental shifts framed the data track:
1. **Human scale → Agent scale**
2. **Reactive intelligence → Proactive action**
3. **Data → Knowledge (semantic)**

IAG's architecture: **"The Connected Network"** — 8 data products underpinning the full insurance value chain (Quote & Buy, Underwriting & Pricing, Claims & Recovery, Proactive Protection), all orchestrated by AI agents on BigQuery + CARTO + Google Enterprise.

---

## Key Learnings: Data Presentations

### 1. Context is Not Optional — It Must Be Built In
> *"Raw data without context is not enough. Agents fail to find answers, hallucinate, and make costly errors."*

Human analysts do invisible "trust work" — they understand business rules, data lineage, and organisational context intuitively. AI agents lack this unless it's explicitly embedded. The answer is Google's **Knowledge Catalog** — a universal context engine integrating BigQuery, SaaS apps (SAP, Salesforce, Workday), operational DBs (AlloyDB, Spanner), and LookML from Looker.

---

### 2. Unstructured Data is Now a First-Class Citizen
BigQuery's new **`ObjectRef`** type (now GA) enables native combination of structured and unstructured data:
- Store audio, video, images, documents in Cloud Storage
- Reference them via `ObjectRef` in BigQuery tables
- Query them with SQL + Python UDFs
- Example use case: *"Which top 10 revenue customers complained about 'performance issues' in audio calls last month?"*

---

### 3. The Five Things Your Data Platform Needs for the Agentic Era
Presented as a maturity pyramid:
1. **Relationships & Ontology** — BQ Graph for understanding how data connects
2. **Multi-cloud** — Cross-Cloud Lakehouse (Managed Iceberg)
3. **Agents** — Data Agent Kit + "Talk to Your Data"
4. **Multimodal Data** — ObjectRef + Geospatial in BigQuery
5. **Business Context** *(top priority)* — Knowledge Catalog + Gemini

---

### 4. The Legacy Architecture Problem ("The Chasm")
Four failure modes of legacy platforms in the agentic era:
- **The Walled Garden**: "Open" systems that are only open within their own walls — governance disappears when you step outside
- **The Trust Gap**: Agents need context, not just data. Without it, confident hallucinations
- **The Human Scale**: Traditional latency (bolt-on AI) destroys the user experience for conversational agents. Requires **Zero-Copy Inference**
- **The Cost Spiral**: Pricing designed for 10 queries/day humans, not 10,000 queries/minute agents

---

### 5. AI Functions Bring Intelligence Directly into SQL
New BigQuery AI functions extend SQL to include intelligence:
- **Existing**: `AI.IF`, `AI.RANK`, `AI.GENERATE`, `AI.FORECAST`
- **New (Preview)**: `AI.ANALYZE_SENTIMENT`, `AI.SUMMARIZE`, `AI.CLASSIFY`, `AI.SCORE`, `AI.PARSE_DOCUMENT`
- **TimesFM**: Google's Time Series Foundation Model — run `AI_FORECAST` over operational data directly in SQL without custom ML pipelines

---

### 6. Multimodal + Vector + Graph: Unlocking Unstructured Enterprise Knowledge
Session: *"Beyond Structured: Activating Enterprise Knowledge"*
- **Multimodal analytics**: Gemini + BigQuery together can query across text, audio, images, video
- **Vector embeddings**: Semantic search and similarity across unstructured content (SCANN supporting 10B+ vectors)
- **Graph analytics**: BQ Graph enables relationship mapping — used in a demo to combine product support manuals + sales data for conversational analytics
- Key insight: combine all three for an AI that can reason across an organisation's full knowledge base

---

### 7. The Active Lakehouse — Merging Operational and Analytical Worlds
The traditional separation between transactional databases (low latency, real-time) and analytical platforms (high scale, historical) is a problem for AI agents that need both simultaneously.

Google's answer: the **Active Lakehouse**
- **Unified ecosystem**: Datastream for real-time streams + BigQuery lakehouse, no data movement needed
- **Instant insights, no disruption**: Spanner Data Boost — analytical queries on mission-critical operational data without impacting production
- **Intelligence to action**: Reverse ETL pushes BigQuery insights back into Spanner for operational use

Concrete capabilities:
- **Batch Reverse ETL to Spanner**: Export BigQuery aggregates/feature vectors to Spanner for low-latency serving
- **Streaming Reverse ETL**: Continuous SQL queries in BigQuery → Spanner in real-time (e.g., real-time ride data, sentiment scores)
- **Spanner Columnar**: Sub-second latency with vectorised execution for analytical queries at millions of QPS

---

### 8. Cross-Cloud Is No Longer Optional
**Borderless Cross-Cloud Foundation** (Preview):
- Extend BigQuery analytics to data sitting in **AWS and Azure** (Azure coming soon)
- High-speed interconnect + cross-cloud caching (smart cache on first read = faster subsequent queries)
- Built on **Apache Iceberg** open table format — single copy, no egress fees

---

### 9. The Data Agent Kit — A New Developer Experience
Google's **Data Agent Kit** (Preview):
- Orchestrate autonomous agents across the full data lifecycle: discovery → development → deployment
- Works in **VS Code**, integrates with **Claude**, **Codex**, and **Gemini**
- Power user terminal experience with **Claude CODE** and **Gemini CLI**
- Purpose: remove manual pipeline plumbing — let agents reason and act in real-time

---

### Session: The Agentic BI Experience — Why a Unified Semantic Layer is the Control Plane for Self-Service Analytics
Featuring **Kogan.com** (Australian retail e-commerce) as a case study.

The central thesis: in a world of autonomous agents, you can't have every AI system interpreting "revenue" differently. A **unified semantic layer is mandatory** infrastructure for the AI era.

---

### 10. Looker as the "Experience Layer" for Data Cloud
Looker was positioned not just as a BI tool but as the governed **experience layer** sitting on top of BigQuery:
- **Self-service dashboards** — business users create and customise their own visualisations
- **Embedded analytics** — BI woven directly into other applications and workflows
- **Conversational Analytics agents** — "Chat with your data" via natural language
- **Data exploration and modelling** — deep analysis and LookML model building

---

### 11. The Core Problem: AI Struggles to Bridge the Structural Gap
A sharp framing of why BI + AI is hard:

> *"What was our net profit in Q1?"*

A human or LLM thinks **procedurally**: look at sales → filter by Q1 → sum sales → sum costs → compute net profit.

A database thinks **declaratively**: `SELECT SUM(revenue - cost) FROM sales JOIN calendar WHERE fiscal_qtr='Q1'`

**AI struggles to reliably translate between these two modes.** Without a semantic layer, every agent answering BI questions is essentially guessing at the SQL — and getting it wrong in subtle, costly ways.

---

### 12. Looker's Semantic Layer (LookML) — The "GPS for Agents"
The analogy used: the **Knowledge Catalog is the map** (where every data asset lives), the **Semantic Layer is the turn-by-turn directions** (the mathematically correct path to a trusted answer).

LookML sits between AI agents and raw data, providing:
- **Deterministic execution logic** — agents can't free-style the SQL; the correct joins and aggregations are pre-defined
- **Security guardrails** — row-level and column-level access enforced at the semantic layer, not bolted on after
- **Business domain separation** — Marketing, Sales, Procurement each have their own defined entities, with explicit relationships between them
- **Auto-generated SQL** — the agent expresses *what* it wants in natural language; LookML handles *how* to retrieve it
- **Agnostic multi-cloud** — works across databases, not just BigQuery

Key capability statuses:
- **Looker UI** (GA) — governed BI + natural language exploration for 2,500+ users
- **Looker Embedded** (GA) — conversational experiences inside existing workflows
- **Conversational Analytics API** (Preview) — custom AI agents for analytics on Gemini models
- **Gemini Enterprise + Looker Agents** (Preview) — publish Looker agents into Gemini Enterprise for agentic BI workflows
- **Looker Core Lineage** (Preview) — column-level data lineage from Looker through to BigQuery

---

### 13. Data Governance Must Serve Both Humans and Agents
A key framing from the governance session:

> *"For years, data governance was built for humans. Now a new stakeholder has arrived: the agent."*

Each role needs something specific:
| Role | Need |
|---|---|
| Data Scientists | High-quality features for model building |
| Data Analysts | Trusted data for dashboards |
| Data Engineers | Lineage for pipeline efficiency |
| **AI Agents** | **Trusted metadata + business semantics** |

The Knowledge Catalog addresses this through three enrichment pillars:
1. **Semantic Translation** — Gemini transforms cryptic metadata into meaningful business definitions
2. **Relational Inference** — continuous log mining to map hidden relationships and recommend queries
3. **Trust & Validation** — automated quality checks, anomaly detection, and human-in-the-loop approval workflows (a "Metadata Change Workflow" UI coming in Q2 2026 with approval queues before changes affect agents)

---

### 14. Column-Level Data Lineage — Now Reaching into Looker
Lineage is now tracked with **column-level precision**, not just table level:
- Automatically parsed across BigQuery, Spark, Airflow, Dataflow, Vertex AI
- Extensible via **OpenLineage** and **MCP**
- Natural language impact analysis powered by **BigQuery Cloud Assist** (Preview, GA Q3 2026)
- **Looker Core Lineage** is in preview — meaning you can now trace a Looker dashboard metric back to its exact source column in a BigQuery table

Practical use: if a source table changes, you can instantly see which Looker dashboards, which metrics, and which agent responses are impacted — before anyone notices a broken number.

---

## One-Line Takeaways

| Theme | Insight |
|---|---|
| Scale | 3.2 quadrillion tokens/month — the numbers are hard to comprehend |
| Differentiation | In the age of abundant intelligence, **your context is your moat** |
| Data architecture | The shift is from *storing data* to *data as an active reasoning agent* |
| Unstructured data | Audio, video, images are now queryable in SQL alongside structured data |
| Multi-cloud | Cross-cloud Iceberg removes the "pick one cloud" constraint |
| Human impact | ReachOut + Ian Thorpe reminded everyone that the stakes are real |
| Semantic layer | LookML is the "GPS for agents" — without it, every AI BI answer is a hallucination waiting to happen |
| Governance | Data governance now has a new stakeholder: the agent. It needs semantics, not just access |
| Lineage | Column-level lineage now connects Looker dashboards back to BigQuery source columns |
| Presentation style | Every session led with a **human story** before the technology — Bunnings garden bed, Transurban commute, Ian Thorpe swimming |

---

> **⚠️ AI-Generated Summary — Disclaimer**
>
> This day summary was synthesised by an AI assistant (GitHub Copilot / Claude Sonnet 4.6) based on transcripts and slide captures collected during Google Cloud Summit Sydney 2026. While every effort has been made to represent the content accurately, this document **may contain errors, omissions, or inaccuracies** — including misattributed quotes, incorrect figures, or misrepresented product capabilities.
>
> Readers are strongly advised to **independently verify any facts, statistics, product claims, or strategic announcements** before citing this summary or making any business, technical, or investment decisions based on its contents. Official Google Cloud announcements, blog posts, and documentation should be treated as the authoritative source.
