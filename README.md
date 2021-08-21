# UISwitch_RXSwift_Sample

sample

```
// スイッチ ON/OFF 処理
cell.switch.rx.controlEvent(.valueChanged)
    .withLatestFrom(cell.switch.rx.value)
    .subscribe(onNext : { bool in
        print(bool)
    }).disposed(by: cell.disposeBag)
```
