# DataShaka Platform

## Overview

The DataShaka Core API is a REST API with a Query and Response model. The response is standard HTTP, so constitutes a stream of data. As a REST API the functionally is described in terms of routes (queries with parameters that will either be GET or POST) and responses that are in the form of streamed documents.

## Elements

- [Katsu](katsu.md)


## Table of contents

- [Principles](principles.md)

    - [Type of API](./principles.md#type-api)
    - [Katsu](./principles.md#katsu)
    - [Orchestration](./principles.md#orchestration)
    - [Calendars](./principles.md#calendars)
    - [Basics](./principles.md#basics)
    - [HTTPS](./principles.md#https)
    - [Key Routes](./principles.md#routes)
    - [Versioning](./principles.md#versionning)
    - [Authentication](./principles.md#authentication)
    - [Convention](./principles.md#convention)
    - [Rate Limits](./principles.md#rate-limits)

- [Glossary of terms](glossary.md)

    - [Katsu](glossary.md#katsu)
    - [Queries](glossary.md#queries)
    - [Calendars](glossary.md#calendars)
    - [Time Granularity](calendars/timegranularity.md)
    - [Chopsticks](tractor/chopsticks.md)
    - [Tractor](glossary.md#tractor)
    - [Tractor Verbs](tractor/verbs/readme.md)
    - [API Implementation](glossary.md#implementation)

- [Routes](routes.md)

    - [Discovery Route](/routes/discovery.md)
    - [Retrieval Route](/routes/retrieve.md)
    - [Upsert Route](/routes/upsert.md)
    - Orchestration Route (***Planned***)
