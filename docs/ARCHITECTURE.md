# Architecture

## Layers
- Presentation: pages, widgets, Riverpod providers
- Domain: entities, repository interfaces, usecases
- Data: datasources, models, repository implementations

## Video Pipeline
Import → FFmpeg command builder → FFmpegKit execution →
Progress parser → Output file → Share sheet

## Storage
- Hive: conversion history, presets
- shared_preferences: theme, defaults
- Device file system: converted files

## Purchases
RevenueCat entitlement "pro_unlock" via one-time $4.99 IAP.
Optional annual plan at $9.99/year.

## Analytics Events
- conversion_started
- conversion_completed { input_format, output_format, size_saved }
- conversion_failed { error_code }
- paywall_viewed
- purchase_completed
