# Copyright 2023 Electimon
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# MTK Common Components
include $(MTK_COMMON_PATH)/components-logic.mk

# Include the selected components' product makefiles and vendor makefiles
include $(COMPONENT_PROD_INCLUDES)
include $(VENDOR_PROD_INCLUDES)
