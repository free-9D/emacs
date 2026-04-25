#include <iostream>
#include <memory>
#include <vector>
#include <stdio.h>

/**
 * @brief Catppuccin 视觉效果演示
 * 观察：注释的颜色（通常是低调的灰色或淡蓝色）
 */
#define MAX_POWER 9001 // 宏定义：观察预处理指令的颜色

namespace DemoSpace {
template <typename T> class ThemeShowcase {
private:
  T value;
  std::string name = "Catppuccin Mocha"; // 字符串：观察绿色的柔和度

public:
  ThemeShowcase(T v) : value(v) {}

  // 函数与参数：观察函数名与变量名的区分度
  void display(const std::vector<int> &numbers) {
    for (auto i : numbers) {
      if (i > MAX_POWER) {
        std::cout << "It's over 9000!" << std::endl;
      }
    }
  }
};
} // namespace DemoSpace

int main() {
  // 关键字：观察 'auto', 'new', 'int' 的颜色
  auto showcase = std::make_unique<DemoSpace::ThemeShowcase<int>>(42);

  // 数字字面量与布尔值
  bool is_beautiful = true;
  int hex_value = 0xFF22AA;

  showcase->display({10, 500, 10000});

  return 0;
}
