/*
 * Copyright 2012-2019 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.springframework.samples.petclinic;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.annotation.ImportRuntimeHints;
import org.springframework.context.event.EventListener;

import java.time.Instant;


/**
 * PetClinic Spring Boot Application.
 *
 * @author Dave Syer
 */
@SpringBootApplication
@ImportRuntimeHints(PetClinicRuntimeHints.class)
public class PetClinicApplication {
	private static long startTime;
	private static long endTime;
	private static long pid;


	public static void main(String[] args) {
		startTime = Instant.now().toEpochMilli(); // Start time in milliseconds
		pid       = ProcessHandle.current().pid();

		SpringApplication.run(PetClinicApplication.class, args);
		if (null == System.getProperty("START_TIME")) {
			System.out.println("START_TIME not set");
			System.out.println("Started up in " + (endTime - startTime) + "ms with PID: " + pid);
		}
	}

	@EventListener(ApplicationReadyEvent.class)
	public void startApp() {
		if (null != System.getProperty("START_TIME")) {
			startTime = Long.parseLong(System.getProperty("START_TIME")); // Start time in milliseconds from environment variable
			endTime   = Instant.now().toEpochMilli();
			pid       = ProcessHandle.current().pid();
			System.out.println("Started up in " + (endTime - startTime) + "ms with PID: " + pid);
		} else {
			endTime = Instant.now().toEpochMilli(); // End time in milliseconds
		}
	}
}
