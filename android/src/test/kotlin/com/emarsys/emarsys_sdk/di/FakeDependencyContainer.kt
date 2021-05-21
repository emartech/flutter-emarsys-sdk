package com.emarsys.emarsys_sdk.di

import android.app.Application
import android.content.SharedPreferences
import com.emarsys.emarsys_sdk.EventHandlerFactory
import com.emarsys.emarsys_sdk.PushTokenStorage
import com.emarsys.emarsys_sdk.commands.EmarsysCommandFactory
import com.emarsys.emarsys_sdk.commands.push.NotificationChannelFactory
import io.mockk.mockk

class FakeDependencyContainer(
    override val application: Application = mockk(relaxed = true),
    override val emarsysCommandFactory: EmarsysCommandFactory = mockk(relaxed = true),
    override val sharedPreferences: SharedPreferences = mockk(relaxed = true),
    override val pushTokenStorage: PushTokenStorage = mockk(relaxed = true),
    override val eventHandlerFactory: EventHandlerFactory = mockk(relaxed = true),
    override val notificationChannelFactory: NotificationChannelFactory = mockk(relaxed = true)
) : DependencyContainer